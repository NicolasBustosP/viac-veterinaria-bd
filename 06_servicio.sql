-- Catálogo de códigos estándar de servicio.

CREATE TABLE servicio (
    cod_servicio  VARCHAR2(20)   NOT NULL,
    descripcion   VARCHAR2(200)  NOT NULL,
    CONSTRAINT pk_servicio PRIMARY KEY (cod_servicio)
);
