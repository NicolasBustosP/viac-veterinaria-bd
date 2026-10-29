-- Títulos y certificaciones del personal.

CREATE TABLE titulo_personal (
    cedula_personal  VARCHAR2(15)   NOT NULL,
    titulo           VARCHAR2(150)  NOT NULL,
    CONSTRAINT pk_titulo_personal PRIMARY KEY (cedula_personal, titulo),
    CONSTRAINT fk_titulo_personal FOREIGN KEY (cedula_personal)
        REFERENCES personal_veterinario (cedula_personal) ON DELETE CASCADE
);
