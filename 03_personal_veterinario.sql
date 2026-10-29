-- Médicos, enfermeros y especialistas de la clínica.

CREATE TABLE personal_veterinario (
    cedula_personal  VARCHAR2(15)   NOT NULL,
    nombre_completo  VARCHAR2(100)  NOT NULL,
    cargo            VARCHAR2(50)   NOT NULL,
    CONSTRAINT pk_personal_veterinario PRIMARY KEY (cedula_personal)
);
