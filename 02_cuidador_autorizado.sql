-- Personas autorizadas para traer al paciente y tomar decisiones médicas.

CREATE TABLE cuidador_autorizado (
    cedula_cuidador  VARCHAR2(15)   NOT NULL,
    nombre_completo  VARCHAR2(100)  NOT NULL,
    CONSTRAINT pk_cuidador_autorizado PRIMARY KEY (cedula_cuidador)
);
