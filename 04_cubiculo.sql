-- Cubiculo fisico para internacion o cirugia. La capacidad depende del peso maximo soportado.
CREATE TABLE cubiculo (
    cod_cubiculo VARCHAR2(10) NOT NULL,
    capacidad    VARCHAR2(10) NOT NULL,
    peso_maximo  NUMBER(6,2)  NOT NULL,
    CONSTRAINT pk_cubiculo PRIMARY KEY (cod_cubiculo),
    CONSTRAINT ck_cubiculo_capacidad CHECK (capacidad IN ('PEQUENO', 'MEDIANO', 'GRANDE')),
    CONSTRAINT ck_cubiculo_peso CHECK (peso_maximo > 0)
);
