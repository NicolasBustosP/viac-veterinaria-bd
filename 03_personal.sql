-- Personal clinico de VIAC (medicos, enfermeros y especialistas).
CREATE TABLE personal (
    cedula_personal VARCHAR2(15)  NOT NULL,
    nombre_completo VARCHAR2(100) NOT NULL,
    cargo           VARCHAR2(20)  NOT NULL,
    sexo            VARCHAR2(1)   NOT NULL,
    direccion       VARCHAR2(150) NOT NULL,
    CONSTRAINT pk_personal PRIMARY KEY (cedula_personal),
    CONSTRAINT ck_personal_cargo CHECK (cargo IN ('MEDICO', 'ENFERMERO', 'ESPECIALISTA')),
    CONSTRAINT ck_personal_sexo CHECK (sexo IN ('M', 'F'))
);
