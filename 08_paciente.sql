-- Paciente animal. Siempre tiene un tutor principal (responsable legal y financiero).
-- Puede existir sin eventos clinicos, sin contratos y sin cuidadores.
CREATE TABLE paciente (
    cod_historia_clinica VARCHAR2(20) NOT NULL,
    nombre               VARCHAR2(60) NOT NULL,
    especie              VARCHAR2(40) NOT NULL,
    raza                 VARCHAR2(60) NOT NULL,
    sexo                 VARCHAR2(1)  NOT NULL,
    fecha_nacimiento     DATE         NOT NULL,
    peso_actual          NUMBER(6,2)  NOT NULL,
    cedula_tutor         VARCHAR2(15) NOT NULL,
    CONSTRAINT pk_paciente PRIMARY KEY (cod_historia_clinica),
    CONSTRAINT fk_paciente_tutor FOREIGN KEY (cedula_tutor) REFERENCES tutor (cedula_tutor),
    CONSTRAINT ck_paciente_sexo CHECK (sexo IN ('M', 'F')),
    CONSTRAINT ck_paciente_peso CHECK (peso_actual > 0)
);
