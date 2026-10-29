-- Contrato de un paciente a un plan, primario o complementario.

CREATE TABLE contrato_afiliacion (
    num_contrato          VARCHAR2(20)  NOT NULL,
    fecha_inicio          DATE          NOT NULL,
    fecha_fin             DATE,
    tipo_contrato         VARCHAR2(15)  NOT NULL,
    cod_historia_clinica  VARCHAR2(20)  NOT NULL,
    cod_plan              VARCHAR2(10)  NOT NULL,
    cod_categoria         VARCHAR2(10)  NOT NULL,
    CONSTRAINT pk_contrato_afiliacion PRIMARY KEY (num_contrato),
    CONSTRAINT fk_contrato_paciente FOREIGN KEY (cod_historia_clinica)
        REFERENCES paciente (cod_historia_clinica),
    CONSTRAINT fk_contrato_plan FOREIGN KEY (cod_plan)
        REFERENCES plan_bienestar (cod_plan),
    CONSTRAINT fk_contrato_categoria FOREIGN KEY (cod_categoria)
        REFERENCES categoria_cobertura (cod_categoria),
    CONSTRAINT ck_contrato_tipo
        CHECK (tipo_contrato IN ('Primario', 'Complementario')),
    CONSTRAINT ck_contrato_fechas
        CHECK (fecha_fin IS NULL OR fecha_fin >= fecha_inicio)
);
