# VIAC — Sistema de Gestión para Veterinaria Integral de Alta Complejidad

DDL (Oracle) del modelo físico de la base de datos del Proyecto 2 del curso de Bases de Datos — Pontificia Universidad Javeriana.

Cada archivo `.sql` crea **una sola tabla** con su llave primaria, llaves foráneas y restricciones `CHECK` / `UNIQUE`. Los archivos están numerados en el orden en que deben ejecutarse.

## Orden de ejecución

Una tabla solo puede crearse después de las tablas a las que referencia con sus llaves foráneas.

| # | Archivo | Tabla | Depende de |
|---|---------|-------|------------|
| 1 | `01_tutor.sql` | TUTOR | — |
| 2 | `02_cuidador_autorizado.sql` | CUIDADOR_AUTORIZADO | — |
| 3 | `03_personal_veterinario.sql` | PERSONAL_VETERINARIO | — |
| 4 | `04_plan_bienestar.sql` | PLAN_BIENESTAR | — |
| 5 | `05_categoria_cobertura.sql` | CATEGORIA_COBERTURA | — |
| 6 | `06_servicio.sql` | SERVICIO | — |
| 7 | `07_paciente.sql` | PACIENTE | TUTOR |
| 8 | `08_alergia_paciente.sql` | ALERGIA_PACIENTE | PACIENTE |
| 9 | `09_autorizacion_cuidador.sql` | AUTORIZACION_CUIDADOR | PACIENTE, CUIDADOR_AUTORIZADO |
| 10 | `10_titulo_personal.sql` | TITULO_PERSONAL | PERSONAL_VETERINARIO |
| 11 | `11_evento_clinico.sql` | EVENTO_CLINICO | PACIENTE, PERSONAL_VETERINARIO, EVENTO_CLINICO (autorreferencia) |
| 12 | `12_motivo_evento.sql` | MOTIVO_EVENTO | EVENTO_CLINICO |
| 13 | `13_contrato_afiliacion.sql` | CONTRATO_AFILIACION | PACIENTE, PLAN_BIENESTAR, CATEGORIA_COBERTURA |
| 14 | `14_cobro_servicio.sql` | COBRO_SERVICIO | EVENTO_CLINICO, PERSONAL_VETERINARIO, CONTRATO_AFILIACION, SERVICIO |

Las tablas 1–6 no tienen llaves foráneas, así que entre ellas el orden no importa.

## Cómo ejecutarlo

**SQL Developer:** abre cada archivo en orden y ejecútalo con *Run Script* (F5).

**SQL\*Plus / SQLcl:** desde la carpeta del repositorio:

```sql
@01_tutor.sql
@02_cuidador_autorizado.sql
@03_personal_veterinario.sql
@04_plan_bienestar.sql
@05_categoria_cobertura.sql
@06_servicio.sql
@07_paciente.sql
@08_alergia_paciente.sql
@09_autorizacion_cuidador.sql
@10_titulo_personal.sql
@11_evento_clinico.sql
@12_motivo_evento.sql
@13_contrato_afiliacion.sql
@14_cobro_servicio.sql
```

## Cómo borrar todo (orden inverso)

Para reconstruir la base desde cero, las tablas se eliminan en el orden inverso al de creación:

```sql
DROP TABLE cobro_servicio;
DROP TABLE contrato_afiliacion;
DROP TABLE motivo_evento;
DROP TABLE evento_clinico;
DROP TABLE titulo_personal;
DROP TABLE autorizacion_cuidador;
DROP TABLE alergia_paciente;
DROP TABLE paciente;
DROP TABLE servicio;
DROP TABLE categoria_cobertura;
DROP TABLE plan_bienestar;
DROP TABLE personal_veterinario;
DROP TABLE cuidador_autorizado;
DROP TABLE tutor;
```

## Decisiones de diseño

- **Atributos multivaluados** (alergias, títulos, motivos clínicos) → tablas propias con llave compuesta.
- **Relación N:M "Autoriza"** (paciente–cuidador) → `AUTORIZACION_CUIDADOR`, que guarda el `parentesco`.
- **Relación recursiva "Origina"** → `EVENTO_CLINICO.id_evento_origen`, llave foránea a la misma tabla. Es `NULL` cuando el evento no proviene de otro.
- **Sexo del paciente:** `'M'` (macho) o `'H'` (hembra).
- **Horas** (`hora_programada`, `hora_realizacion`): texto en formato `HH24:MI`, validado con `REGEXP_LIKE`.
- Un evento **no realizado** tiene `fecha_realizacion` y `hora_realizacion` en `NULL`.
- **Cobros:** `monto_pagado` nunca supera `monto_facturado`. El saldo pendiente es `monto_facturado - monto_pagado`.
- **Excedente de cobertura:** si una atención supera el tope del contrato primario, el excedente se registra como otro cobro bajo el contrato complementario (`tipo_contrato = 'Complementario'`).
- Las tablas dependientes de un atributo multivaluado o de la relación N:M usan `ON DELETE CASCADE`. Las demás llaves foráneas no permiten borrar el registro padre mientras tenga hijos.
