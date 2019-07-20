CREATE TYPE "tipo_proyecto" AS ENUM (
  'hardware',
  'software'
);

CREATE TYPE "tipo_sexo" AS ENUM (
  'masculino',
  'femenino'
);

CREATE TYPE "tipo_usuario" AS ENUM (
  'manager',
  'administrador',
  'supervisor',
  'participante'
);

CREATE TABLE "usuario" (
  "id" int PRIMARY KEY,
  "nombre" varchar NOT NULL,
  "apellido_paterno" varchar NOT NULL,
  "apellido_materno" varchar,
  "curp" varchar NOT NULL,
  "rfc" varchar NOT NULL,
  "sexo" "tipo_sexo",
  "username" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "correo" varchar NOT NULL
);

CREATE TABLE "direccion" (
  "id" int PRIMARY KEY,
  "id_usuario" int NOT NULL,
  "calle" varchar NOT NULL,
  "colonia" varchar NOT NULL,
  "cp" varchar NOT NULL,
  "municipio" varchar NOT NULL,
  "estado" varchar NOT NULL,
  "pais" varchar NOT NULL
);

CREATE TABLE "sesion_usuario" (
  "id" int PRIMARY KEY,
  "fecha_creacion" datetime NOT NULL,
  "expiracion" datetime NOT NULL,
  "tipo" "tipo_usuario",
  "id_usuario" int
);

CREATE TABLE "proyecto" (
  "id" int PRIMARY KEY,
  "nombre" varchar NOT NULL,
  "tipo" "tipo_proyecto",
  "fecha_creacion" date,
  "fecha_actualizacion" date
);

CREATE TABLE "encargado_proyecto" (
  "id" int PRIMARY KEY,
  "id_usuario" int,
  "id_proyecto" int
);

CREATE TABLE "participante_proyecto" (
  "id" int PRIMARY KEY,
  "id_usuario" int,
  "id_proyecto" int
);

CREATE TABLE "tarea_proyecto" (
  "id" int PRIMARY KEY,
  "id_encargado" int NOT NULL,
  "id_proyecto" int NOT NULL,
  "nombre" varchar NOT NULL,
  "descripcion" varchar NOT NULL,
  "fecha_creacion" date NOT NULL,
  "fecha_vencimiento" date,
  "fecha_cancelacion" date,
  "fecha_actualizacion" date
);

CREATE TABLE "tareas_relacionadas" (
  "id" int PRIMARY KEY,
  "id_principal" int,
  "id_relacionada" int
);

CREATE TABLE "entrega_tarea" (
  "id" int PRIMARY KEY,
  "id_tarea" int NOT NULL,
  "descripcion" varchar,
  "calificacion" int NOT NULL
);

ALTER TABLE "entrega_tarea" ADD FOREIGN KEY ("id_tarea") REFERENCES "tarea_proyecto" ("id");

ALTER TABLE "tareas_relacionadas" ADD FOREIGN KEY ("id_principal") REFERENCES "tarea_proyecto" ("id");

ALTER TABLE "tareas_relacionadas" ADD FOREIGN KEY ("id_relacionada") REFERENCES "tarea_proyecto" ("id");

ALTER TABLE "tarea_proyecto" ADD FOREIGN KEY ("id_encargado") REFERENCES "usuario" ("id");

ALTER TABLE "tarea_proyecto" ADD FOREIGN KEY ("id_proyecto") REFERENCES "proyecto" ("id");

ALTER TABLE "participante_proyecto" ADD FOREIGN KEY ("id_usuario") REFERENCES "usuario" ("id");

ALTER TABLE "participante_proyecto" ADD FOREIGN KEY ("id_proyecto") REFERENCES "proyecto" ("id");

ALTER TABLE "encargado_proyecto" ADD FOREIGN KEY ("id_usuario") REFERENCES "usuario" ("id");

ALTER TABLE "encargado_proyecto" ADD FOREIGN KEY ("id_proyecto") REFERENCES "proyecto" ("id");

ALTER TABLE "direccion" ADD FOREIGN KEY ("id_usuario") REFERENCES "usuario" ("id");

ALTER TABLE "sesion_usuario" ADD FOREIGN KEY ("id_usuario") REFERENCES "usuario" ("id");