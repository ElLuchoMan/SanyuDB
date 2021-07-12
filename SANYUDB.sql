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
