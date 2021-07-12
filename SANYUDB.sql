/* 
 Identificadores de las columnas
 ─ K : Identifica las llaves primarias
 ─ N : Identifica los nombres
 ─ S : Identifica opciones de seguridad
 ─ F : Identifica las fechas
 ─ H : Identifica las horas
 ─ O : Identifica otros tipos de dato
 */
begin EXECUTE IMMEDIATE 'DROP TABLE   "COMPANIA" CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
end;
/
begin EXECUTE IMMEDIATE 'DROP TABLE   "CONTRATISTA" CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
end;
/
begin EXECUTE IMMEDIATE 'DROP TABLE   "JORNADA" CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
end;
/
begin EXECUTE IMMEDIATE 'DROP TABLE   "ROL" CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
end;
/
begin EXECUTE IMMEDIATE 'DROP TABLE   "TURNO" CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
end;
/
begin EXECUTE IMMEDIATE 'DROP TABLE   "TURNO_CONTRATISTA" CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
end;
/
/* Tablas */
CREATE TABLE "COMPANIA" (
	"K_NITCOMPANIA" NUMBER(10) NOT NULL,
	-- NIT de la compania
	"N_RAZONSOCIAL" VARCHAR2(50) NOT NULL,
	-- Razon social de la compania
	"O_TELEFONO" VARCHAR2(50) NOT NULL,
	-- Telefono de la compania
	"O_DIRECCION" VARCHAR2(50) NOT NULL -- Direccion de la compania
);

CREATE TABLE "CONTRATISTA" (
	"K_DOCUMENTO" NUMBER(10) NOT NULL,
	-- Identificador unico del contratista
	"S_PASSWORD" VARCHAR2(50) NOT NULL,
	-- Password de acceso al sistema
	"N_NOMBRECONTRATISTA" VARCHAR2(50) NOT NULL,
	-- Nombre del contratista
	"O_TELEFONO" VARCHAR2(50) NOT NULL,
	-- Telefono del contratista
	"O_ESTADOCONTRATISTA" VARCHAR2(50) DEFAULT 'Activo' NULL,
	-- Estado del contratista dentro de SANYU (Activo - Inactivo)
	"K_NITCOMPANIA" NUMBER(10) NULL,
	"K_IDROL" NUMBER(10) NULL -- Rol del contratista
);

CREATE TABLE "JORNADA" (
	"K_IDJORNADA" NUMBER(10) NOT NULL,
	-- Identificador unico de la jornada
	"N_NOMBREJORNADA" VARCHAR2(50) NULL,
	-- Nombre de la jornada
	"O_ESTADOJORNADA" VARCHAR2(50) DEFAULT 'Activo' NULL -- Estado de la jornada (Activo - Inactivo)
);

CREATE TABLE "ROL" (
	"K_IDROL" NUMBER(10) NOT NULL,
	-- Identificador unico del rol
	"N_NOMBREROL" VARCHAR2(50) NOT NULL,
	-- Nombre del rol
	"O_ESTADOROL" VARCHAR2(50) DEFAULT 'Activo' NULL -- Estado del rol (Activo - Inactivo)
);

CREATE TABLE "TURNO" (
	"K_IDTURNO" NUMBER(10) NOT NULL,
	-- Identificador unico del turno
	"H_HORAINICIO" VARCHAR2(10) NOT NULL,
	-- Hora de inicio del turno de trabajo
	"H_HORAFIN" VARCHAR2(10) NOT NULL,
	-- Hora final del turno de trabajo
	"O_LABOR" VARCHAR2(50) NOT NULL,
	-- Labor a desempenar durante el turno
	"F_FECHAINICIO" DATE NULL,
	-- Fecha de inicio de los turnos del contratista
	"F_FECHAFIN" DATE NULL,
	-- Fecha final de los turnos del contratista
	"K_IDJORNADA" NUMBER(10) NULL,
	-- Jornada en que se desarrolla el turno
	"O_USUARIOMODIFICADOR" VARCHAR2(50) NULL,
	-- Usuario que modifica los turnos del contratista
	"F_FECHAMODIFICACION" DATE NULL,
	-- Fecha en que se realiza la modificacion del turno
	"O_RAZONMODIFICACION" VARCHAR2(50) NULL,
	-- Razon que lleva a la ampliacion del turno
	"H_INICIOTURNO" VARCHAR2(50) NULL,
	-- Hora en que el contratista indica que inicia el turno de trabajo
	"H_FINTURNO" VARCHAR2(50) NULL,
	-- Hora en la que el contratista indica que finaliza su turno de trabajo
	"O_ESTADO" VARCHAR2(50) DEFAULT 'Activo' NULL -- Estado del turno (Activo - Inactivo)
);

CREATE TABLE "TURNO_CONTRATISTA" (
	"K_DOCUMENTO" NUMBER(10) NOT NULL,
	-- Documento del contratista
	"K_IDTURNO" NUMBER(10) NOT NULL -- Turno a laborar
);

/* Commentarios */
COMMENT ON TABLE "COMPANIA" IS 'Entidad encargada de almacenar los datos de la compañia';

COMMENT ON COLUMN "COMPANIA"."K_NITCOMPANIA" IS 'NIT de la compania';

COMMENT ON COLUMN "COMPANIA"."N_RAZONSOCIAL" IS 'Razon social de la compania';

COMMENT ON COLUMN "COMPANIA"."O_TELEFONO" IS 'Telefono de la compania';

COMMENT ON COLUMN "COMPANIA"."O_DIRECCION" IS 'Direccion de la compania';

COMMENT ON TABLE "CONTRATISTA" IS 'Enitdad encargada de almacenar los datos de los contratistas';

COMMENT ON COLUMN "CONTRATISTA"."K_DOCUMENTO" IS 'Identificador unico del contratista';

COMMENT ON COLUMN "CONTRATISTA"."S_PASSWORD" IS 'Password de acceso al sistema';

COMMENT ON COLUMN "CONTRATISTA"."N_NOMBRECONTRATISTA" IS 'Nombre del contratista';

COMMENT ON COLUMN "CONTRATISTA"."O_TELEFONO" IS 'Telefono del contratista';

COMMENT ON COLUMN "CONTRATISTA"."O_ESTADOCONTRATISTA" IS 'Estado del contratista dentro de SANYU (Activo - Inactivo)';

COMMENT ON COLUMN "CONTRATISTA"."K_IDROL" IS 'Rol del contratista';

COMMENT ON TABLE "JORNADA" IS 'Entidad encargada de almacenar las jornada de trabajo';

COMMENT ON COLUMN "JORNADA"."K_IDJORNADA" IS 'Identificador unico de la jornada';

COMMENT ON COLUMN "JORNADA"."N_NOMBREJORNADA" IS 'Nombre de la jornada';

COMMENT ON COLUMN "JORNADA"."O_ESTADOJORNADA" IS 'Estado de la jornada (Activo - Inactivo)';

COMMENT ON TABLE "ROL" IS 'Entidad encargada de almacenar los roles de los usuarios';

COMMENT ON COLUMN "ROL"."K_IDROL" IS 'Identificador unico del rol';

COMMENT ON COLUMN "ROL"."N_NOMBREROL" IS 'Nombre del rol';

COMMENT ON COLUMN "ROL"."O_ESTADOROL" IS 'Estado del rol (Activo - Inactivo)';

COMMENT ON TABLE "TURNO" IS 'Entidad encargada de almacenar los turnos de los usuarios';

COMMENT ON COLUMN "TURNO"."K_IDTURNO" IS 'Identificador unico del turno';

COMMENT ON COLUMN "TURNO"."H_HORAINICIO" IS 'Hora de inicio del turno de trabajo';

COMMENT ON COLUMN "TURNO"."H_HORAFIN" IS 'Hora final del turno de trabajo';

COMMENT ON COLUMN "TURNO"."O_LABOR" IS 'Labor a desempenar durante el turno';

COMMENT ON COLUMN "TURNO"."F_FECHAINICIO" IS 'Fecha de inicio de los turnos del contratista';

COMMENT ON COLUMN "TURNO"."F_FECHAFIN" IS 'Fecha final de los turnos del contratista';

COMMENT ON COLUMN "TURNO"."K_IDJORNADA" IS 'Jornada en que se desarrolla el turno';

COMMENT ON COLUMN "TURNO"."O_USUARIOMODIFICADOR" IS 'Usuario que modifica los turnos del contratista';

COMMENT ON COLUMN "TURNO"."F_FECHAMODIFICACION" IS 'Fecha en que se realiza la modificacion del turno';

COMMENT ON COLUMN "TURNO"."O_RAZONMODIFICACION" IS 'Razon que lleva a la ampliacion del turno';

COMMENT ON COLUMN "TURNO"."H_INICIOTURNO" IS 'Hora en que el contratista indica que inicia el turno de trabajo';

COMMENT ON COLUMN "TURNO"."H_FINTURNO" IS 'Hora en la que el contratista indica que finaliza su turno de trabajo';

COMMENT ON COLUMN "TURNO"."O_ESTADO" IS 'Estado del turno (Activo - Inactivo)';

COMMENT ON TABLE "TURNO_CONTRATISTA" IS 'Entidad encargada de almacenar los turnos de los contratistas';

COMMENT ON COLUMN "TURNO_CONTRATISTA"."K_DOCUMENTO" IS 'Documento del contratista';

COMMENT ON COLUMN "TURNO_CONTRATISTA"."K_IDTURNO" IS 'Turno a laborar';

/* Llaves primarias */
ALTER TABLE
	"COMPANIA"
ADD
	CONSTRAINT "PK_NITCOMPANIA" PRIMARY KEY ("K_NITCOMPANIA") USING INDEX;

ALTER TABLE
	"COMPANIA"
ADD
	CONSTRAINT "O_TELEFONO" UNIQUE ("O_TELEFONO") USING INDEX;

ALTER TABLE
	"CONTRATISTA"
ADD
	CONSTRAINT "PK_DOCUMENTO" PRIMARY KEY ("K_DOCUMENTO") USING INDEX;

ALTER TABLE
	"CONTRATISTA"
ADD
	CONSTRAINT "Q_TELEFONO" UNIQUE ("O_TELEFONO") USING INDEX;

CREATE INDEX "IXFK_CONTRATISTA_ROL" ON "CONTRATISTA" ("K_IDROL");

CREATE INDEX "IXFK_CONTRATISTAS_COMPANIA" ON "CONTRATISTA" ("K_NITCOMPANIA");

ALTER TABLE
	"JORNADA"
ADD
	CONSTRAINT "PK_IDJORNADA" PRIMARY KEY ("K_IDJORNADA") USING INDEX;

ALTER TABLE
	"ROL"
ADD
	CONSTRAINT "PK_IDROL" PRIMARY KEY ("K_IDROL") USING INDEX;

ALTER TABLE
	"TURNO"
ADD
	CONSTRAINT "PK_IDTURNO" PRIMARY KEY ("K_IDTURNO") USING INDEX;

CREATE INDEX "IXFK_TURNO_JORNADA" ON "TURNO" ("K_IDJORNADA");

ALTER TABLE
	"TURNO_CONTRATISTA"
ADD
	CONSTRAINT "PK_TURNO_CONTRATISTA" PRIMARY KEY ("K_DOCUMENTO", "K_IDTURNO") USING INDEX;

CREATE INDEX "IXFK_CONTRATISTA_TURNO" ON "TURNO_CONTRATISTA" ("K_DOCUMENTO");

CREATE INDEX "IXFK_TURNO_CONTRATISTA" ON "TURNO_CONTRATISTA" ("K_IDTURNO");

/* Llaves foráneas */
ALTER TABLE
	"CONTRATISTA"
ADD
	CONSTRAINT "FK_CONTRATISTA_ROL" FOREIGN KEY ("K_IDROL") REFERENCES "ROL" ("K_IDROL");

ALTER TABLE
	"CONTRATISTA"
ADD
	CONSTRAINT "FK_CONTRATISTAS_COMPANIA" FOREIGN KEY ("K_NITCOMPANIA") REFERENCES "COMPANIA" ("K_NITCOMPANIA");

ALTER TABLE
	"TURNO"
ADD
	CONSTRAINT "FK_TURNO_JORNADA" FOREIGN KEY ("K_IDJORNADA") REFERENCES "JORNADA" ("K_IDJORNADA");

ALTER TABLE
	"TURNO_CONTRATISTA"
ADD
	CONSTRAINT "FK_CONTRATISTA_TURNO" FOREIGN KEY ("K_DOCUMENTO") REFERENCES "CONTRATISTA" ("K_DOCUMENTO");

ALTER TABLE
	"TURNO_CONTRATISTA"
ADD
	CONSTRAINT "FK_TURNO_CONTRATISTA" FOREIGN KEY ("K_IDTURNO") REFERENCES "TURNO" ("K_IDTURNO");

/* Secuencias */
CREATE SEQUENCE TURNO_SEQ
 INCREMENT BY 1 START WITH 1;
CREATE  OR REPLACE TRIGGER AUTO_ID_TURNO
BEFORE INSERT ON TURNO
FOR EACH ROW
BEGIN
  SELECT TURNO_SEQ.NEXTVAL INTO :NEW.K_IDTURNO FROM DUAL;
END;

