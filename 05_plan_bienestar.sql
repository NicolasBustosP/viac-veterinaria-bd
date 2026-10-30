-- Portafolio de planes de salud prepagada (Cachorro, Senior, Premium, ...).
CREATE TABLE plan_bienestar (
    cod_plan          VARCHAR2(10)  NOT NULL,
    nombre            VARCHAR2(50)  NOT NULL,
    valor_mensualidad NUMBER(12,2)  NOT NULL,
    CONSTRAINT pk_plan_bienestar PRIMARY KEY (cod_plan),
    CONSTRAINT uq_plan_nombre UNIQUE (nombre),
    CONSTRAINT ck_plan_mensualidad CHECK (valor_mensualidad >= 0)
);
