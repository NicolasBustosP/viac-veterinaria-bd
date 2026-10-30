-- Datos de prueba.

-- Codigos de razon de saldo: R01 tope de cobertura excedido, R02 pago parcial acordado con el tutor, R03 pendiente de autorizacion/pago de la aseguradora.

-- tutor
INSERT INTO tutor VALUES ('1012345678', 'Carlos Ramirez Pena', 'Cra 7 No 45-12, Bogota', 'carlos.ramirez@correo.com');
INSERT INTO tutor VALUES ('52123456', 'Marcela Gomez Duarte', 'Calle 100 No 15-30, Bogota', 'marcela.gomez@correo.com');
INSERT INTO tutor VALUES ('79876543', 'Andres Felipe Torres', 'Av Suba No 120-45, Bogota', 'andres.torres@correo.com');
INSERT INTO tutor VALUES ('1032456789', 'Laura Sofia Martinez', 'Cra 15 No 85-20, Bogota', 'laura.martinez@correo.com');
INSERT INTO tutor VALUES ('80123987', 'Jorge Enrique Castillo', 'Calle 26 No 68-10, Bogota', 'jorge.castillo@correo.com');

-- paciente
INSERT INTO paciente VALUES ('HC-0001', 'Max', 'Canino', 'Golden Retriever', 'M', DATE '2019-03-14', 32.5, '1012345678');
INSERT INTO paciente VALUES ('HC-0002', 'Luna', 'Canino', 'Golden Retriever', 'F', DATE '2021-07-02', 27.8, '1012345678');
INSERT INTO paciente VALUES ('HC-0003', 'Rocky', 'Canino', 'Bulldog Frances', 'M', DATE '2020-11-21', 13.2, '52123456');
INSERT INTO paciente VALUES ('HC-0004', 'Bella', 'Canino', 'Bulldog Frances', 'F', DATE '2022-01-09', 11.4, '52123456');
INSERT INTO paciente VALUES ('HC-0005', 'Michi', 'Felino', 'Siames', 'F', DATE '2018-05-30', 4.3, '79876543');
INSERT INTO paciente VALUES ('HC-0006', 'Simba', 'Felino', 'Criollo', 'M', DATE '2023-02-17', 3.9, '79876543');
INSERT INTO paciente VALUES ('HC-0007', 'Thor', 'Canino', 'Labrador', 'M', DATE '2016-09-05', 36.0, '1032456789');
INSERT INTO paciente VALUES ('HC-0008', 'Canela', 'Canino', 'Beagle', 'F', DATE '2024-04-12', 8.1, '1032456789');
INSERT INTO paciente VALUES ('HC-0009', 'Coco', 'Canino', 'Schnauzer', 'M', DATE '2015-12-01', 9.7, '80123987');
INSERT INTO paciente VALUES ('HC-0010', 'Nala', 'Felino', 'Persa', 'F', DATE '2025-08-20', 1.8, '80123987');

-- alergia_paciente
INSERT INTO alergia_paciente VALUES ('HC-0001', 'Penicilina');
INSERT INTO alergia_paciente VALUES ('HC-0001', 'Pollo');
INSERT INTO alergia_paciente VALUES ('HC-0003', 'Polen');
INSERT INTO alergia_paciente VALUES ('HC-0005', 'Pescado');
INSERT INTO alergia_paciente VALUES ('HC-0007', 'Sulfas');

-- cuidador_autorizado
INSERT INTO cuidador_autorizado VALUES ('1098765432', 'Daniela Ramirez Soto');
INSERT INTO cuidador_autorizado VALUES ('1011122233', 'Sergio Gomez Leon');
INSERT INTO cuidador_autorizado VALUES ('1055566677', 'Paola Rincon Diaz');
INSERT INTO cuidador_autorizado VALUES ('79111222', 'Camila Torres Ruiz');
INSERT INTO cuidador_autorizado VALUES ('1020304050', 'Mateo Castillo Vega');

-- autorizacion_cuidador
INSERT INTO autorizacion_cuidador VALUES ('HC-0001', '1098765432', 'HIJA');
INSERT INTO autorizacion_cuidador VALUES ('HC-0002', '1098765432', 'HIJA');
INSERT INTO autorizacion_cuidador VALUES ('HC-0003', '1011122233', 'CONYUGE');
INSERT INTO autorizacion_cuidador VALUES ('HC-0003', '1055566677', 'PASEADOR');
INSERT INTO autorizacion_cuidador VALUES ('HC-0004', '1055566677', 'PASEADOR');
INSERT INTO autorizacion_cuidador VALUES ('HC-0005', '79111222', 'HERMANA');
INSERT INTO autorizacion_cuidador VALUES ('HC-0009', '1020304050', 'HIJO');

-- personal
INSERT INTO personal VALUES ('51234567', 'Ana Maria Lopez Rojas', 'MEDICO', 'F', 'Cra 11 No 70-25, Bogota');
INSERT INTO personal VALUES ('80234567', 'Ricardo Salazar Mora', 'MEDICO', 'M', 'Calle 53 No 20-14, Bogota');
INSERT INTO personal VALUES ('1019876543', 'Natalia Vargas Pardo', 'ENFERMERO', 'F', 'Cra 30 No 45-03, Bogota');
INSERT INTO personal VALUES ('1023456789', 'Julian Ortiz Baquero', 'ENFERMERO', 'M', 'Calle 80 No 50-22, Bogota');
INSERT INTO personal VALUES ('52345678', 'Patricia Mendez Cruz', 'ESPECIALISTA', 'F', 'Av 19 No 104-60, Bogota');
INSERT INTO personal VALUES ('79345678', 'Felipe Cardenas Ibanez', 'ESPECIALISTA', 'M', 'Cra 9 No 63-18, Bogota');

-- titulo_personal
INSERT INTO titulo_personal VALUES ('51234567', 'Medicina Veterinaria y Zootecnia');
INSERT INTO titulo_personal VALUES ('51234567', 'Especializacion en Clinica de Pequenos Animales');
INSERT INTO titulo_personal VALUES ('80234567', 'Medicina Veterinaria');
INSERT INTO titulo_personal VALUES ('1019876543', 'Tecnico en Auxiliar de Enfermeria Veterinaria');
INSERT INTO titulo_personal VALUES ('1023456789', 'Tecnico en Auxiliar de Enfermeria Veterinaria');
INSERT INTO titulo_personal VALUES ('1023456789', 'Certificacion en Administracion de Medicamentos Veterinarios');
INSERT INTO titulo_personal VALUES ('52345678', 'Medicina Veterinaria');
INSERT INTO titulo_personal VALUES ('52345678', 'Especialista en Cirugia de Tejidos Blandos');
INSERT INTO titulo_personal VALUES ('79345678', 'Especialista en Diagnostico por Imagen');

-- cubiculo
INSERT INTO cubiculo VALUES ('CUB-P1', 'PEQUENO', 10);
INSERT INTO cubiculo VALUES ('CUB-P2', 'PEQUENO', 10);
INSERT INTO cubiculo VALUES ('CUB-M1', 'MEDIANO', 25);
INSERT INTO cubiculo VALUES ('CUB-M2', 'MEDIANO', 25);
INSERT INTO cubiculo VALUES ('CUB-G1', 'GRANDE', 50);
INSERT INTO cubiculo VALUES ('CUB-G2', 'GRANDE', 50);

-- evento_clinico
INSERT INTO evento_clinico VALUES (1, 'CITA', TIMESTAMP '2026-03-02 09:00:00', TIMESTAMP '2026-03-02 09:10:00', 'HC-0001', '51234567', NULL, NULL);
INSERT INTO evento_clinico VALUES (2, 'EXAMEN', TIMESTAMP '2026-03-02 11:00:00', TIMESTAMP '2026-03-02 11:20:00', 'HC-0001', '79345678', NULL, 1);
INSERT INTO evento_clinico VALUES (3, 'PROCEDIMIENTO', TIMESTAMP '2026-03-09 08:00:00', TIMESTAMP '2026-03-09 08:15:00', 'HC-0001', '52345678', 'CUB-G1', 2);
INSERT INTO evento_clinico VALUES (4, 'CONTROL', TIMESTAMP '2026-03-16 10:00:00', TIMESTAMP '2026-03-16 10:05:00', 'HC-0001', '51234567', NULL, 3);
INSERT INTO evento_clinico VALUES (5, 'CITA', TIMESTAMP '2026-05-04 15:00:00', TIMESTAMP '2026-05-04 15:05:00', 'HC-0003', '80234567', NULL, NULL);
INSERT INTO evento_clinico VALUES (6, 'EXAMEN', TIMESTAMP '2026-05-04 16:00:00', TIMESTAMP '2026-05-04 16:30:00', 'HC-0003', '79345678', NULL, 5);
INSERT INTO evento_clinico VALUES (7, 'PROCEDIMIENTO', TIMESTAMP '2026-05-11 07:30:00', TIMESTAMP '2026-05-11 07:45:00', 'HC-0003', '52345678', 'CUB-M1', 6);
INSERT INTO evento_clinico VALUES (8, 'CITA', TIMESTAMP '2026-01-20 10:00:00', TIMESTAMP '2026-01-20 10:10:00', 'HC-0002', '80234567', NULL, NULL);
INSERT INTO evento_clinico VALUES (9, 'CITA', TIMESTAMP '2026-02-10 14:00:00', TIMESTAMP '2026-02-10 14:05:00', 'HC-0004', '80234567', NULL, NULL);
INSERT INTO evento_clinico VALUES (10, 'CITA', TIMESTAMP '2026-06-15 09:30:00', TIMESTAMP '2026-06-15 09:40:00', 'HC-0005', '51234567', NULL, NULL);
INSERT INTO evento_clinico VALUES (11, 'EXAMEN', TIMESTAMP '2026-06-15 11:00:00', TIMESTAMP '2026-06-15 11:25:00', 'HC-0005', '79345678', NULL, 10);
INSERT INTO evento_clinico VALUES (12, 'CONTROL', TIMESTAMP '2026-07-01 10:00:00', TIMESTAMP '2026-07-01 10:10:00', 'HC-0005', '51234567', NULL, 11);
INSERT INTO evento_clinico VALUES (13, 'CITA', TIMESTAMP '2026-08-03 08:30:00', TIMESTAMP '2026-08-03 08:40:00', 'HC-0007', '80234567', NULL, NULL);
INSERT INTO evento_clinico VALUES (14, 'PROCEDIMIENTO', TIMESTAMP '2026-08-10 07:00:00', TIMESTAMP '2026-08-10 07:20:00', 'HC-0007', '52345678', 'CUB-G2', 13);
INSERT INTO evento_clinico VALUES (15, 'CITA', TIMESTAMP '2026-05-05 16:00:00', TIMESTAMP '2026-05-05 16:05:00', 'HC-0008', '80234567', NULL, NULL);
INSERT INTO evento_clinico VALUES (16, 'CITA', TIMESTAMP '2026-10-28 11:00:00', TIMESTAMP '2026-10-28 11:10:00', 'HC-0006', '51234567', NULL, NULL);
INSERT INTO evento_clinico VALUES (17, 'CITA', TIMESTAMP '2022-01-18 10:00:00', TIMESTAMP '2022-01-18 10:10:00', 'HC-0002', '80234567', NULL, NULL);
INSERT INTO evento_clinico VALUES (18, 'CITA', TIMESTAMP '2026-10-31 10:00:00', NULL, 'HC-0001', '51234567', NULL, NULL);

-- motivo_evento
INSERT INTO motivo_evento VALUES (1, 1, 'Valoracion general por decaimiento y perdida de apetito');
INSERT INTO motivo_evento VALUES (2, 1, 'Hemograma y radiografia ordenados tras valoracion');
INSERT INTO motivo_evento VALUES (3, 1, 'Resultado de examen indica masa abdominal; cirugia programada');
INSERT INTO motivo_evento VALUES (3, 2, 'Extirpacion de masa en tejidos blandos');
INSERT INTO motivo_evento VALUES (4, 1, 'Control postoperatorio y retiro de puntos');
INSERT INTO motivo_evento VALUES (5, 1, 'Cojera en miembro posterior');
INSERT INTO motivo_evento VALUES (6, 1, 'Examen de laboratorio y radiografia de cadera');
INSERT INTO motivo_evento VALUES (7, 1, 'Correccion quirurgica ordenada por hallazgos radiograficos');
INSERT INTO motivo_evento VALUES (8, 1, 'Refuerzo de vacunacion anual');
INSERT INTO motivo_evento VALUES (9, 1, 'Esquema de vacunacion de cachorro');
INSERT INTO motivo_evento VALUES (10, 1, 'Vomito recurrente');
INSERT INTO motivo_evento VALUES (11, 1, 'Ecografia abdominal y hemograma');
INSERT INTO motivo_evento VALUES (12, 1, 'Control de evolucion tras examenes');
INSERT INTO motivo_evento VALUES (13, 1, 'Dolor al caminar');
INSERT INTO motivo_evento VALUES (14, 1, 'Cirugia ortopedica ordenada en la cita');
INSERT INTO motivo_evento VALUES (15, 1, 'Vacunacion de cachorro');
INSERT INTO motivo_evento VALUES (16, 1, 'Revision de rutina');
INSERT INTO motivo_evento VALUES (17, 1, 'Vacunacion de cachorro');
INSERT INTO motivo_evento VALUES (18, 1, 'Chequeo semestral programado');

-- plan_bienestar
INSERT INTO plan_bienestar VALUES ('PLN-CACH', 'Plan Cachorro', 45000);
INSERT INTO plan_bienestar VALUES ('PLN-SENI', 'Plan Senior', 85000);
INSERT INTO plan_bienestar VALUES ('PLN-PREM', 'Plan Premium', 120000);

-- categoria_cobertura
INSERT INTO categoria_cobertura VALUES ('CAT-VAC', 'Vacunacion', 150000);
INSERT INTO categoria_cobertura VALUES ('CAT-CIR', 'Cirugia', 2500000);
INSERT INTO categoria_cobertura VALUES ('CAT-FAR', 'Farmacia', 300000);
INSERT INTO categoria_cobertura VALUES ('CAT-DIA', 'Diagnostico', 800000);

-- contrato_afiliacion
INSERT INTO contrato_afiliacion VALUES ('CTR-2024-001', DATE '2024-01-10', NULL, 'PRIMARIO', 'HC-0001', 'PLN-PREM', 'CAT-CIR');
INSERT INTO contrato_afiliacion VALUES ('CTR-2025-002', DATE '2025-02-01', NULL, 'COMPLEMENTARIO', 'HC-0001', 'PLN-SENI', 'CAT-CIR');
INSERT INTO contrato_afiliacion VALUES ('CTR-2022-010', DATE '2021-09-01', DATE '2023-12-31', 'PRIMARIO', 'HC-0002', 'PLN-CACH', 'CAT-VAC');
INSERT INTO contrato_afiliacion VALUES ('CTR-2024-003', DATE '2024-03-15', NULL, 'PRIMARIO', 'HC-0002', 'PLN-PREM', 'CAT-VAC');
INSERT INTO contrato_afiliacion VALUES ('CTR-2025-004', DATE '2025-01-01', NULL, 'PRIMARIO', 'HC-0003', 'PLN-PREM', 'CAT-CIR');
INSERT INTO contrato_afiliacion VALUES ('CTR-2025-005', DATE '2025-01-20', NULL, 'PRIMARIO', 'HC-0004', 'PLN-CACH', 'CAT-VAC');
INSERT INTO contrato_afiliacion VALUES ('CTR-2025-006', DATE '2025-03-01', NULL, 'PRIMARIO', 'HC-0005', 'PLN-SENI', 'CAT-DIA');
INSERT INTO contrato_afiliacion VALUES ('CTR-2025-007', DATE '2025-04-01', NULL, 'PRIMARIO', 'HC-0007', 'PLN-SENI', 'CAT-CIR');
INSERT INTO contrato_afiliacion VALUES ('CTR-2026-008', DATE '2026-04-15', NULL, 'PRIMARIO', 'HC-0008', 'PLN-CACH', 'CAT-VAC');
INSERT INTO contrato_afiliacion VALUES ('CTR-2026-009', DATE '2026-09-01', NULL, 'PRIMARIO', 'HC-0006', 'PLN-CACH', 'CAT-VAC');

-- servicio
INSERT INTO servicio VALUES ('SRV-001', 'Consulta general');
INSERT INTO servicio VALUES ('SRV-002', 'Consulta con especialista');
INSERT INTO servicio VALUES ('SRV-010', 'Radiografia');
INSERT INTO servicio VALUES ('SRV-011', 'Examen de laboratorio - hemograma');
INSERT INTO servicio VALUES ('SRV-012', 'Ecografia abdominal');
INSERT INTO servicio VALUES ('SRV-020', 'Cirugia de tejidos blandos');
INSERT INTO servicio VALUES ('SRV-021', 'Anestesia general');
INSERT INTO servicio VALUES ('SRV-030', 'Dia de cubiculo');
INSERT INTO servicio VALUES ('SRV-040', 'Vacuna polivalente');
INSERT INTO servicio VALUES ('SRV-041', 'Vacuna antirrabica');
INSERT INTO servicio VALUES ('SRV-050', 'Dosis de antibiotico (Kardex)');
INSERT INTO servicio VALUES ('SRV-051', 'Dosis de analgesico (Kardex)');
INSERT INTO servicio VALUES ('SRV-052', 'Suero intravenoso');
INSERT INTO servicio VALUES ('SRV-060', 'Control postoperatorio');

-- cobro_servicio
INSERT INTO cobro_servicio VALUES (1, DATE '2026-03-02', 80000, 80000, DATE '2026-03-02', NULL, 1, '51234567', 'CTR-2024-001', 'SRV-001');
INSERT INTO cobro_servicio VALUES (2, DATE '2026-03-02', 120000, 120000, DATE '2026-03-03', NULL, 2, '79345678', 'CTR-2024-001', 'SRV-011');
INSERT INTO cobro_servicio VALUES (3, DATE '2026-03-02', 150000, 150000, DATE '2026-03-03', NULL, 2, '79345678', 'CTR-2024-001', 'SRV-010');
INSERT INTO cobro_servicio VALUES (4, DATE '2026-03-09', 2500000, 2500000, DATE '2026-03-12', NULL, 3, '52345678', 'CTR-2024-001', 'SRV-020');
INSERT INTO cobro_servicio VALUES (5, DATE '2026-03-09', 700000, 500000, DATE '2026-03-12', 'R02', 3, '52345678', 'CTR-2025-002', 'SRV-020');
INSERT INTO cobro_servicio VALUES (6, DATE '2026-03-09', 450000, 450000, DATE '2026-03-12', NULL, 3, '52345678', 'CTR-2024-001', 'SRV-021');
INSERT INTO cobro_servicio VALUES (7, DATE '2026-03-10', 180000, 180000, DATE '2026-03-12', NULL, 3, '1019876543', 'CTR-2024-001', 'SRV-030');
INSERT INTO cobro_servicio VALUES (8, DATE '2026-03-09', 35000, 35000, DATE '2026-03-12', NULL, 3, '1019876543', 'CTR-2024-001', 'SRV-050');
INSERT INTO cobro_servicio VALUES (9, DATE '2026-03-16', 60000, 60000, DATE '2026-03-16', NULL, 4, '51234567', 'CTR-2024-001', 'SRV-060');
INSERT INTO cobro_servicio VALUES (10, DATE '2026-05-04', 90000, 90000, DATE '2026-05-04', NULL, 5, '80234567', 'CTR-2025-004', 'SRV-001');
INSERT INTO cobro_servicio VALUES (11, DATE '2026-05-04', 120000, 0, NULL, 'R03', 6, '79345678', 'CTR-2025-004', 'SRV-011');
INSERT INTO cobro_servicio VALUES (12, DATE '2026-05-04', 150000, 100000, DATE '2026-05-10', 'R02', 6, '79345678', 'CTR-2025-004', 'SRV-010');
INSERT INTO cobro_servicio VALUES (13, DATE '2026-05-11', 2500000, 1500000, DATE '2026-05-20', 'R03', 7, '52345678', 'CTR-2025-004', 'SRV-020');
INSERT INTO cobro_servicio VALUES (14, DATE '2026-05-12', 100000, 0, NULL, 'R03', 7, '1023456789', 'CTR-2025-004', 'SRV-030');
INSERT INTO cobro_servicio VALUES (15, DATE '2026-05-11', 40000, 40000, DATE '2026-05-20', NULL, 7, '1023456789', 'CTR-2025-004', 'SRV-051');
INSERT INTO cobro_servicio VALUES (16, DATE '2026-01-20', 85000, 85000, DATE '2026-01-20', NULL, 8, '80234567', 'CTR-2024-003', 'SRV-040');
INSERT INTO cobro_servicio VALUES (17, DATE '2026-01-20', 70000, 50000, DATE '2026-01-20', 'R02', 8, '80234567', 'CTR-2024-003', 'SRV-001');
INSERT INTO cobro_servicio VALUES (18, DATE '2022-01-18', 60000, 60000, DATE '2022-01-18', NULL, 17, '80234567', 'CTR-2022-010', 'SRV-040');
INSERT INTO cobro_servicio VALUES (19, DATE '2026-02-10', 55000, 55000, DATE '2026-02-10', NULL, 9, '80234567', 'CTR-2025-005', 'SRV-041');
INSERT INTO cobro_servicio VALUES (20, DATE '2026-02-10', 70000, 30000, DATE '2026-02-10', 'R02', 9, '80234567', 'CTR-2025-005', 'SRV-001');
INSERT INTO cobro_servicio VALUES (21, DATE '2026-06-15', 80000, 80000, DATE '2026-06-15', NULL, 10, '51234567', 'CTR-2025-006', 'SRV-001');
INSERT INTO cobro_servicio VALUES (22, DATE '2026-06-15', 220000, 220000, DATE '2026-06-16', NULL, 11, '79345678', 'CTR-2025-006', 'SRV-012');
INSERT INTO cobro_servicio VALUES (23, DATE '2026-06-15', 120000, 120000, DATE '2026-06-16', NULL, 11, '79345678', 'CTR-2025-006', 'SRV-011');
INSERT INTO cobro_servicio VALUES (24, DATE '2026-07-01', 60000, 0, NULL, 'R03', 12, '51234567', 'CTR-2025-006', 'SRV-060');
INSERT INTO cobro_servicio VALUES (25, DATE '2026-08-03', 90000, 90000, DATE '2026-08-03', NULL, 13, '80234567', 'CTR-2025-007', 'SRV-001');
INSERT INTO cobro_servicio VALUES (26, DATE '2026-08-10', 1900000, 1900000, DATE '2026-08-14', NULL, 14, '52345678', 'CTR-2025-007', 'SRV-020');
INSERT INTO cobro_servicio VALUES (27, DATE '2026-08-11', 120000, 60000, DATE '2026-08-14', 'R02', 14, '1023456789', 'CTR-2025-007', 'SRV-030');
INSERT INTO cobro_servicio VALUES (28, DATE '2026-08-10', 35000, 35000, DATE '2026-08-14', NULL, 14, '1019876543', 'CTR-2025-007', 'SRV-050');
INSERT INTO cobro_servicio VALUES (29, DATE '2026-05-05', 85000, 85000, DATE '2026-05-05', NULL, 15, '80234567', 'CTR-2026-008', 'SRV-040');
INSERT INTO cobro_servicio VALUES (30, DATE '2026-05-05', 70000, 70000, DATE '2026-05-05', NULL, 15, '80234567', 'CTR-2026-008', 'SRV-001');

-- Con IDENTITY ... BY DEFAULT los INSERT con ID explicito no avanzan la secuencia interna.
-- Se reposiciona para que los proximos INSERT sin ID no choquen con los datos de prueba.
ALTER TABLE evento_clinico MODIFY id_evento GENERATED BY DEFAULT AS IDENTITY (START WITH LIMIT VALUE);
ALTER TABLE cobro_servicio MODIFY id_cobro GENERATED BY DEFAULT AS IDENTITY (START WITH LIMIT VALUE);

COMMIT;
