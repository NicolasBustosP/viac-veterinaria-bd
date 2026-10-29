-- Categorías de cobertura con el valor máximo cubierto por servicio.

CREATE TABLE categoria_cobertura (
    cod_categoria          VARCHAR2(10)   NOT NULL,
    nombre                 VARCHAR2(50)   NOT NULL,
    valor_maximo_servicio  NUMBER(12,2)   NOT NULL,
    CONSTRAINT pk_categoria_cobertura PRIMARY KEY (cod_categoria),
    CONSTRAINT uq_categoria_cobertura_nombre UNIQUE (nombre),
    CONSTRAINT ck_categoria_cobertura_valor CHECK (valor_maximo_servicio >= 0)
);
