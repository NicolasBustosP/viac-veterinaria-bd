-- Motivos clínicos de cada evento.

CREATE TABLE motivo_evento (
    id_evento    NUMBER(10)     NOT NULL,
    num_motivo   NUMBER(3)      NOT NULL,
    descripcion  VARCHAR2(300)  NOT NULL,
    CONSTRAINT pk_motivo_evento PRIMARY KEY (id_evento, num_motivo),
    CONSTRAINT fk_motivo_evento FOREIGN KEY (id_evento)
        REFERENCES evento_clinico (id_evento) ON DELETE CASCADE,
    CONSTRAINT ck_motivo_num CHECK (num_motivo > 0)
);
