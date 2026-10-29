-- Citas, exámenes, procedimientos y controles; id_evento_origen enlaza el evento que lo originó.

CREATE TABLE evento_clinico (
    id_evento             NUMBER(10)    NOT NULL,
    tipo_evento           VARCHAR2(15)  NOT NULL,
    fecha_programada      DATE          NOT NULL,
    hora_programada       VARCHAR2(5)   NOT NULL,
    fecha_realizacion     DATE,
    hora_realizacion      VARCHAR2(5),
    cod_historia_clinica  VARCHAR2(20)  NOT NULL,
    cedula_personal       VARCHAR2(15)  NOT NULL,
    id_evento_origen      NUMBER(10),
    CONSTRAINT pk_evento_clinico PRIMARY KEY (id_evento),
    CONSTRAINT fk_evento_paciente FOREIGN KEY (cod_historia_clinica)
        REFERENCES paciente (cod_historia_clinica),
    CONSTRAINT fk_evento_personal FOREIGN KEY (cedula_personal)
        REFERENCES personal_veterinario (cedula_personal),
    CONSTRAINT fk_evento_origen FOREIGN KEY (id_evento_origen)
        REFERENCES evento_clinico (id_evento),
    CONSTRAINT ck_evento_tipo
        CHECK (tipo_evento IN ('Cita', 'Examen', 'Procedimiento', 'Control')),
    CONSTRAINT ck_evento_hora_prog
        CHECK (REGEXP_LIKE(hora_programada, '^([01][0-9]|2[0-3]):[0-5][0-9]$')),
    CONSTRAINT ck_evento_hora_real
        CHECK (hora_realizacion IS NULL
               OR REGEXP_LIKE(hora_realizacion, '^([01][0-9]|2[0-3]):[0-5][0-9]$')),
    CONSTRAINT ck_evento_realizacion
        CHECK ((fecha_realizacion IS NULL AND hora_realizacion IS NULL)
            OR (fecha_realizacion IS NOT NULL AND hora_realizacion IS NOT NULL)),
    CONSTRAINT ck_evento_origen CHECK (id_evento_origen <> id_evento)
);
