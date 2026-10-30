-- Relacion N:M entre paciente y cuidador autorizado. Guarda el parentesco o vinculo.
CREATE TABLE autorizacion_cuidador (
    cod_historia_clinica VARCHAR2(20) NOT NULL,
    cedula_cuidador      VARCHAR2(15) NOT NULL,
    parentesco           VARCHAR2(30) NOT NULL,
    CONSTRAINT pk_autorizacion_cuidador PRIMARY KEY (cod_historia_clinica, cedula_cuidador),
    CONSTRAINT fk_autorizacion_paciente FOREIGN KEY (cod_historia_clinica) REFERENCES paciente (cod_historia_clinica),
    CONSTRAINT fk_autorizacion_cuidador FOREIGN KEY (cedula_cuidador) REFERENCES cuidador_autorizado (cedula_cuidador)
);
