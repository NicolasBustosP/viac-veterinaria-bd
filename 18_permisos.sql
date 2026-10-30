-- Permisos sobre las vistas. Los roles consultan solo a traves de las vistas, sin acceso directo a las tablas.
-- Requiere el privilegio CREATE ROLE (o ejecutar como DBA).

CREATE ROLE rol_gerencia;     -- ve todas las vistas
CREATE ROLE rol_facturacion;  -- vistas financieras
CREATE ROLE rol_clinico;      -- vistas de atencion clinica

GRANT SELECT ON v_estado_cuenta_paciente TO rol_gerencia, rol_facturacion;
GRANT SELECT ON v_cobros_pendientes_raza_sexo TO rol_gerencia, rol_facturacion;
GRANT SELECT ON v_cobros_plan_contrato TO rol_gerencia, rol_facturacion;
GRANT SELECT ON v_pacientes_cuidadores TO rol_gerencia, rol_clinico;
GRANT SELECT ON v_trazabilidad_eventos TO rol_gerencia, rol_clinico;

--GRANT rol_gerencia    TO usuario_gerente;
--GRANT rol_facturacion TO usuario_facturador;
--GRANT rol_clinico     TO usuario_medico;
