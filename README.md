# VIAC — Sistema de Gestión para Veterinaria Integral de Alta Complejidad

Base de datos (Oracle) del Proyecto 2 del curso de Bases de Datos — Pontificia Universidad Javeriana.

Los archivos `01`–`15` crean **una sola tabla** cada uno, con su llave primaria, llaves foráneas y restricciones `CHECK` / `UNIQUE`. Los archivos `16`–`18` cargan los datos de prueba, crean las vistas y asignan los permisos. Todos están numerados en el orden en que deben ejecutarse.

## Orden de ejecución

Una tabla solo puede crearse después de las tablas a las que referencia con sus llaves foráneas.

| # | Archivo | Contenido | Depende de |
|---|---------|-----------|------------|
| 1 | `01_tutor.sql` | TUTOR | — |
| 2 | `02_cuidador_autorizado.sql` | CUIDADOR_AUTORIZADO | — |
| 3 | `03_personal.sql` | PERSONAL | — |
| 4 | `04_cubiculo.sql` | CUBICULO | — |
| 5 | `05_plan_bienestar.sql` | PLAN_BIENESTAR | — |
| 6 | `06_categoria_cobertura.sql` | CATEGORIA_COBERTURA | — |
| 7 | `07_servicio.sql` | SERVICIO | — |
| 8 | `08_paciente.sql` | PACIENTE | TUTOR |
| 9 | `09_alergia_paciente.sql` | ALERGIA_PACIENTE | PACIENTE |
| 10 | `10_autorizacion_cuidador.sql` | AUTORIZACION_CUIDADOR | PACIENTE, CUIDADOR_AUTORIZADO |
| 11 | `11_titulo_personal.sql` | TITULO_PERSONAL | PERSONAL |
| 12 | `12_evento_clinico.sql` | EVENTO_CLINICO | PACIENTE, PERSONAL, CUBICULO, EVENTO_CLINICO (autorreferencia) |
| 13 | `13_motivo_evento.sql` | MOTIVO_EVENTO | EVENTO_CLINICO |
| 14 | `14_contrato_afiliacion.sql` | CONTRATO_AFILIACION | PACIENTE, PLAN_BIENESTAR, CATEGORIA_COBERTURA |
| 15 | `15_cobro_servicio.sql` | COBRO_SERVICIO | EVENTO_CLINICO, PERSONAL, CONTRATO_AFILIACION, SERVICIO |
| 16 | `16_datos_prueba.sql` | Datos de prueba | Tablas 1–15 |
| 17 | `17_vistas.sql` | Vistas de las consultas | Tablas 1–15 |
| 18 | `18_permisos.sql` | Roles y permisos sobre las vistas | Vistas (requiere `CREATE ROLE` o DBA) |

Las tablas 1–7 no tienen llaves foráneas, así que entre ellas el orden no importa.

## Cómo ejecutarlo

**SQL Developer:** abre cada archivo en orden y ejecútalo con *Run Script* (F5).

**SQL\*Plus / SQLcl:** desde la carpeta del repositorio:

```sql
@01_tutor.sql
@02_cuidador_autorizado.sql
@03_personal.sql
@04_cubiculo.sql
@05_plan_bienestar.sql
@06_categoria_cobertura.sql
@07_servicio.sql
@08_paciente.sql
@09_alergia_paciente.sql
@10_autorizacion_cuidador.sql
@11_titulo_personal.sql
@12_evento_clinico.sql
@13_motivo_evento.sql
@14_contrato_afiliacion.sql
@15_cobro_servicio.sql
@16_datos_prueba.sql
@17_vistas.sql
@18_permisos.sql
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
DROP TABLE cubiculo;
DROP TABLE personal;
DROP TABLE cuidador_autorizado;
DROP TABLE tutor;
```

## Decisiones de diseño

- **Atributos multivaluados** (alergias, títulos, motivos clínicos) → tablas propias con llave compuesta.
- **Relación N:M "Autoriza"** (paciente–cuidador) → `AUTORIZACION_CUIDADOR`, que guarda el `parentesco`.
- **Relación recursiva "Origina"** → `EVENTO_CLINICO.id_evento_origen`, llave foránea a la misma tabla. Es `NULL` cuando el evento no proviene de otro, y es `UNIQUE`: un evento origina como máximo un evento derivado.
- **Cubículo:** `EVENTO_CLINICO.cod_cubiculo` es `NULL` cuando el evento no requiere internación ni cirugía.
- **Sexo** (paciente y personal): `'M'` o `'F'`.
- **Fechas y horas** de los eventos: `TIMESTAMP`. Un evento **no realizado** tiene `fecha_hora_realizacion` en `NULL`.
- **Cobros:** `monto_pagado` nunca supera `monto_facturado`. El saldo pendiente (`monto_facturado - monto_pagado`) se calcula en las consultas, no se almacena. `cod_razon_saldo` solo aplica cuando queda saldo pendiente.
- **Excedente de cobertura:** si una atención supera el tope del contrato primario, el excedente se registra como otro cobro bajo el contrato complementario (`tipo_contrato = 'COMPLEMENTARIO'`).
