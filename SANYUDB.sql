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
