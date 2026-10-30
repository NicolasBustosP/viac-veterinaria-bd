-- Catalogo estandar de servicios (consulta, radiografia, dia de cubiculo, dosis de medicamento, ...).
CREATE TABLE servicio (
    cod_servicio VARCHAR2(15)  NOT NULL,
    descripcion  VARCHAR2(200) NOT NULL,
    CONSTRAINT pk_servicio PRIMARY KEY (cod_servicio)
);
