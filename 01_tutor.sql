-- Tutor principal del paciente, responsable legal y financiero.

CREATE TABLE tutor (
    cedula_tutor        VARCHAR2(15)   NOT NULL,
    nombre_completo     VARCHAR2(100)  NOT NULL,
    direccion           VARCHAR2(150),
    correo_electronico  VARCHAR2(100),
    CONSTRAINT pk_tutor PRIMARY KEY (cedula_tutor),
    CONSTRAINT uq_tutor_correo UNIQUE (correo_electronico),
    CONSTRAINT ck_tutor_correo CHECK (correo_electronico LIKE '%_@_%._%')
);
