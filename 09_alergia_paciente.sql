-- Alergias conocidas del paciente (atributo multivalorado, una fila por alergia).
CREATE TABLE alergia_paciente (
    cod_historia_clinica VARCHAR2(20)  NOT NULL,
    alergia              VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_alergia_paciente PRIMARY KEY (cod_historia_clinica, alergia),
    CONSTRAINT fk_alergia_paciente FOREIGN KEY (cod_historia_clinica) REFERENCES paciente (cod_historia_clinica)
);
