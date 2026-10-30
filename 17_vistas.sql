-- Vistas de las consultas minimas solicitadas.

-- 1. Estado de cuenta por paciente (la ultima fila es el total general de la clinica).
CREATE OR REPLACE VIEW v_estado_cuenta_paciente AS
SELECT nombre_paciente, sexo, total_eventos, total_facturado, total_pagado, saldo_pendiente
FROM (
    SELECT 1 AS orden,
           p.nombre AS nombre_paciente,
           p.sexo AS sexo,
           NVL(e.total_eventos, 0) AS total_eventos,
           NVL(c.total_facturado, 0) AS total_facturado,
           NVL(c.total_pagado, 0) AS total_pagado,
           NVL(c.total_facturado, 0) - NVL(c.total_pagado, 0) AS saldo_pendiente
    FROM paciente p
    LEFT JOIN (SELECT cod_historia_clinica, COUNT(*) AS total_eventos
               FROM evento_clinico
               GROUP BY cod_historia_clinica) e
           ON e.cod_historia_clinica = p.cod_historia_clinica
    LEFT JOIN (SELECT ev.cod_historia_clinica,
                      SUM(cs.monto_facturado) AS total_facturado,
                      SUM(cs.monto_pagado) AS total_pagado
               FROM cobro_servicio cs
               JOIN evento_clinico ev ON ev.id_evento = cs.id_evento
               GROUP BY ev.cod_historia_clinica) c
           ON c.cod_historia_clinica = p.cod_historia_clinica
    UNION ALL
    SELECT 2,
           'TOTAL GENERAL',
           NULL,
           (SELECT COUNT(*) FROM evento_clinico),
           NVL((SELECT SUM(monto_facturado) FROM cobro_servicio), 0),
           NVL((SELECT SUM(monto_pagado) FROM cobro_servicio), 0),
           NVL((SELECT SUM(monto_facturado) - SUM(monto_pagado) FROM cobro_servicio), 0)
    FROM DUAL
)
ORDER BY orden, nombre_paciente;

-- 2. Enfoque clinico: cobros no cubiertos totalmente por raza y sexo del paciente.
CREATE OR REPLACE VIEW v_cobros_pendientes_raza_sexo AS
SELECT p.raza AS "Raza",
       SUM(CASE WHEN p.sexo = 'M' THEN 1 ELSE 0 END) AS "Numero de cobros (Macho)",
       SUM(CASE WHEN p.sexo = 'F' THEN 1 ELSE 0 END) AS "Numero de cobros (Hembra)",
       SUM(cs.monto_facturado - cs.monto_pagado) AS "Valor de cobros no pagado totalmente"
FROM cobro_servicio cs
JOIN evento_clinico ev ON ev.id_evento = cs.id_evento
JOIN paciente p ON p.cod_historia_clinica = ev.cod_historia_clinica
WHERE cs.monto_facturado - cs.monto_pagado <> 0
GROUP BY p.raza
ORDER BY p.raza;

-- 3. Pacientes y cuidadores autorizados (incluye pacientes sin cuidadores).
CREATE OR REPLACE VIEW v_pacientes_cuidadores AS
SELECT p.nombre AS nombre_paciente,
       c.nombre_completo AS nombre_cuidador,
       a.parentesco
FROM paciente p
LEFT JOIN autorizacion_cuidador a ON a.cod_historia_clinica = p.cod_historia_clinica
LEFT JOIN cuidador_autorizado c ON c.cedula_cuidador = a.cedula_cuidador
ORDER BY p.nombre, c.nombre_completo;

-- 4. Cobros por plan de bienestar y contrato (incluye contratos sin cobros).
CREATE OR REPLACE VIEW v_cobros_plan_contrato AS
SELECT pl.nombre AS nombre_plan,
       ct.num_contrato,
       COUNT(cs.id_cobro) AS total_cobros
FROM contrato_afiliacion ct
JOIN plan_bienestar pl ON pl.cod_plan = ct.cod_plan
LEFT JOIN cobro_servicio cs ON cs.num_contrato = ct.num_contrato
GROUP BY pl.nombre, ct.num_contrato
ORDER BY pl.nombre, ct.num_contrato;

-- 5. Trazabilidad de la cadena de eventos clinicos.
CREATE OR REPLACE VIEW v_trazabilidad_eventos AS
SELECT e.id_evento,
       e.tipo_evento,
       COUNT(cs.id_cobro) AS total_cobros,
       d.id_evento AS id_evento_derivado
FROM evento_clinico e
LEFT JOIN cobro_servicio cs ON cs.id_evento = e.id_evento
LEFT JOIN evento_clinico d ON d.id_evento_origen = e.id_evento
GROUP BY e.id_evento, e.tipo_evento, d.id_evento
ORDER BY e.id_evento;
