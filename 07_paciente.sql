-- Paciente animal, identificado por su código de historia clínica.

CREATE TABLE paciente (
    cod_historia_clinica  VARCHAR2(20)   NOT NULL,
    nombre                VARCHAR2(60)   NOT NULL,
    especie               VARCHAR2(40)   NOT NULL,
    raza                  VARCHAR2(60),
    sexo                  CHAR(1)        NOT NULL,
    fecha_nacimiento      DATE,
    peso_actual           NUMBER(6,2),
    cedula_tutor          VARCHAR2(15)   NOT NULL,
    CONSTRAINT pk_paciente PRIMARY KEY (cod_historia_clinica),
    CONSTRAINT fk_paciente_tutor FOREIGN KEY (cedula_tutor)
        REFERENCES tutor (cedula_tutor),
    CONSTRAINT ck_paciente_sexo CHECK (sexo IN ('M', 'H')),
    CONSTRAINT ck_paciente_peso CHECK (peso_actual > 0)
);
