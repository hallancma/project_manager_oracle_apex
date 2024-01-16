DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO v_count
    FROM all_tables
   WHERE table_name = 'PM_USUARIO'
     AND owner = 'HALLANCHRISTIAN131';

  IF v_count = 0 THEN
    EXECUTE IMMEDIATE 'CREATE TABLE PM_USUARIO (
                      ID NUMBER NOT NULL ENABLE,
                      NOME VARCHAR2(255),
                      PASSWORD VARCHAR2(4000),
                      TOKEN VARCHAR2(255),
                      CONSTRAINT USUARIO_PK PRIMARY KEY (ID) ENABLE
                      )';
  ELSE
    dbms_output.put_line('TABELA JA EXISTE !');
  END IF;
END;

/

DECLARE
  v_count INTEGER;
BEGIN
  SELECT COUNT(*)
    INTO v_count
    FROM user_sequences
   WHERE sequence_name = 'PM_USUARIO_SEQ';

  IF v_count = 0 THEN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE "PM_USUARIO_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE';
  ELSE
    dbms_output.put_line('JÁ EXISTE A SEQUENCE PM_USUARIO_SEQ');
  END IF;
END;
/

declare 
  l_count integer;
begin
  select count(*)
    into l_count
  from user_triggers
  where trigger_name = 'TRG_PM_USUARIO';

  if l_count > 0 then 
     execute immediate 'drop trigger TRG_PM_USUARIO';
  end if;

end;
/

CREATE TRIGGER "TRG_PM_USUARIO"
  BEFORE INSERT ON "PM_USUARIO"
  FOR EACH ROW
BEGIN
  IF :NEW."ID" IS NULL THEN
    SELECT "PM_USUARIO_SEQ".nextval
      INTO :NEW."ID"
      FROM sys.dual;
  END IF;
END;
  /
ALTER TRIGGER "TRG_PM_USUARIO"
  ENABLE;
/
DECLARE v_count NUMBER; BEGIN SELECT COUNT(*) INTO v_count FROM all_tables WHERE table_name = 'PM_PAGINA' AND owner = 'HALLANCHRISTIAN131';

IF v_count = 0 THEN EXECUTE IMMEDIATE 'CREATE TABLE PM_PAGINA (
                      ID NUMBER NOT NULL ENABLE,
                      NOME VARCHAR2(255),
                      APEX_APP_ID NUMBER,
                      APEX_PAGE_ID NUMBER,
                      CONSTRAINT PM_PAGINA_PK PRIMARY KEY (ID) ENABLE
                      )'; ELSE dbms_output.put_line('TABELA JA EXISTE !'); END IF; END;

  /

DECLARE
  v_count INTEGER;
BEGIN
  SELECT COUNT(*)
    INTO v_count
    FROM user_sequences
   WHERE sequence_name = 'PM_PAGINA_SEQ';

  IF v_count = 0 THEN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE "PM_PAGINA_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE';
  ELSE
    dbms_output.put_line('JÁ EXISTE A SEQUENCE PM_PAGINA_SEQ');
  END IF;
END;
/

DECLARE
  l_count INTEGER;
BEGIN
  SELECT COUNT(*)
    INTO l_count
    FROM user_triggers
   WHERE trigger_name = 'TRG_PM_PAGINA';

  IF l_count > 0 THEN
    EXECUTE IMMEDIATE 'drop trigger TRG_PM_PAGINA';
  END IF;

END;
/

CREATE TRIGGER "TRG_PM_PAGINA"
  BEFORE INSERT ON "PM_PAGINA"
  FOR EACH ROW
BEGIN
  IF :NEW."ID" IS NULL THEN
    SELECT "PM_PAGINA_SEQ".nextval
      INTO :NEW."ID"
      FROM sys.dual;
  END IF;
END;
  /
ALTER TRIGGER "TRG_PM_PAGINA"
  ENABLE;
/

DECLARE v_count NUMBER; BEGIN SELECT COUNT(*) INTO v_count FROM all_tables WHERE table_name = 'PM_ROLE' AND owner = 'HALLANCHRISTIAN131';

IF v_count = 0 THEN EXECUTE IMMEDIATE 'CREATE TABLE PM_ROLE (
                      ID NUMBER NOT NULL ENABLE,
                      NOME VARCHAR2(255),
                      APEX_PAGES VARCHAR2(4000),
                      CONSTRAINT PM_ROLE_PK PRIMARY KEY (ID) ENABLE
                      )'; ELSE dbms_output.put_line('TABELA JA EXISTE !'); END IF; END;

/

DECLARE
  v_count INTEGER;
BEGIN
  SELECT COUNT(*)
    INTO v_count
    FROM user_sequences
   WHERE sequence_name = 'PM_ROLE_SEQ';

  IF v_count = 0 THEN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE "PM_ROLE_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE';
  ELSE
    dbms_output.put_line('JÁ EXISTE A SEQUENCE PM_ROLE_SEQ');
  END IF;
END;
/

DECLARE
  l_count INTEGER;
BEGIN
  SELECT COUNT(*)
    INTO l_count
    FROM user_triggers
   WHERE trigger_name = 'TRG_PM_ROLE';

  IF l_count > 0 THEN
    EXECUTE IMMEDIATE 'drop trigger TRG_PM_ROLE';
  END IF;

END;
/

CREATE TRIGGER "TRG_PM_ROLE"
  BEFORE INSERT ON "PM_ROLE"
  FOR EACH ROW
BEGIN
  IF :NEW."ID" IS NULL THEN
    SELECT "PM_ROLE_SEQ".nextval
      INTO :NEW."ID"
      FROM sys.dual;
  END IF;
END;
/
ALTER TRIGGER  "TRG_PM_ROLE" ENABLE;
/

DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO v_count
    FROM all_tables
   WHERE table_name = 'PM_GRUPO'
     AND owner = 'HALLANCHRISTIAN131';

  IF v_count = 0 THEN
    EXECUTE IMMEDIATE 'CREATE TABLE PM_GRUPO (
                      ID NUMBER NOT NULL ENABLE,
                      NOME VARCHAR2(255),
                      ROLES VARCHAR2(4000),
                      CONSTRAINT PM_GRUPO_PK PRIMARY KEY (ID) ENABLE
                      )';
  ELSE
    dbms_output.put_line('TABELA JA EXISTE !');
  END IF;
END;

/

DECLARE
  v_count INTEGER;
BEGIN
  SELECT COUNT(*)
    INTO v_count
    FROM user_sequences
   WHERE sequence_name = 'PM_GRUPO_SEQ';

  IF v_count = 0 THEN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE "PM_GRUPO_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE';
  ELSE
    dbms_output.put_line('JÁ EXISTE A SEQUENCE PM_GRUPO_SEQ');
  END IF;
END;
/

DECLARE
  l_count INTEGER;
BEGIN
  SELECT COUNT(*)
    INTO l_count
    FROM user_triggers
   WHERE trigger_name = 'TRG_PM_GRUPO';

  IF l_count > 0 THEN
    EXECUTE IMMEDIATE 'drop trigger TRG_PM_GRUPO';
  END IF;

END;
/

CREATE TRIGGER "TRG_PM_GRUPO"
  BEFORE INSERT ON "PM_GRUPO"
  FOR EACH ROW
BEGIN
  IF :NEW."ID" IS NULL THEN
    SELECT "PM_GRUPO_SEQ".nextval
      INTO :NEW."ID"
      FROM sys.dual;
  END IF;
END;
/
ALTER TRIGGER  "TRG_PM_GRUPO" ENABLE;
/

DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO v_count
    FROM all_tables
   WHERE table_name = 'PM_GRUPO_USUARIO'
     AND owner = 'HALLANCHRISTIAN131';

  IF v_count = 0 THEN
    EXECUTE IMMEDIATE 'CREATE TABLE PM_GRUPO_USUARIO (
                      ID NUMBER NOT NULL ENABLE,
                      PM_USUARIO_ID NUMBER,
                      PM_GRUPO_ID NUMBER,
                      CONSTRAINT PM_GRUPO_USUARIO_PK PRIMARY KEY (ID) ENABLE
                      )';
  ELSE
    dbms_output.put_line('TABELA JA EXISTE !');
  END IF;
END;

/
DECLARE
  v_count INTEGER;
BEGIN
  SELECT COUNT(*)
    INTO v_count
    FROM user_constraints
   WHERE constraint_name = 'PM_GRUPO_USUARIO_FK_PM_USUARIO';

  IF v_count = 0 THEN
    EXECUTE IMMEDIATE 'ALTER TABLE PM_GRUPO_USUARIO ADD CONSTRAINT "PM_GRUPO_USUARIO_FK_PM_USUARIO" FOREIGN KEY (PM_USUARIO_ID)
      REFERENCES  PM_USUARIO (ID) ENABLE';
  ELSE
    dbms_output.put_line('A FOREIGN KEY PM_GRUPO_USUARIO_FK_PM_USUARIO JÁ EXISTE.');
  END IF;
END;
/


DECLARE
  v_count_idx INTEGER;
BEGIN
  SELECT COUNT(*)
    INTO v_count_idx
    FROM user_indexes
   WHERE index_name = 'PM_GRUPO_USUARIO_IDX_PM_USUARIO'
     AND table_name = 'PM_GRUPO_USUARIO';

  IF v_count_idx = 0 THEN
    EXECUTE IMMEDIATE 'CREATE INDEX  "PM_GRUPO_USUARIO_IDX_PM_USUARIO" ON  "PM_GRUPO_USUARIO" ("PM_USUARIO_ID")';
  ELSE
    dbms_output.put_line('JÁ EXISTE O PM_GRUPO_USUARIO_IDX_PM_USUARIO ');
  END IF;
END;
/
DECLARE
  v_count INTEGER;
BEGIN
  SELECT COUNT(*)
    INTO v_count
    FROM user_constraints
   WHERE constraint_name = 'PM_GRUPO_USUARIO_FK_PM_GRUPO';

  IF v_count = 0 THEN
    EXECUTE IMMEDIATE 'ALTER TABLE PM_GRUPO_USUARIO ADD CONSTRAINT "PM_GRUPO_USUARIO_FK_PM_GRUPO" FOREIGN KEY (PM_GRUPO_ID)
      REFERENCES PM_GRUPO (ID) ENABLE';
  ELSE
    dbms_output.put_line('A FOREIGN KEY PM_GRUPO_USUARIO_FK_PM_GRUPO JÁ EXISTE.');
  END IF;
END;
/

DECLARE
  v_count_idx INTEGER;
BEGIN
  SELECT COUNT(*)
    INTO v_count_idx
    FROM user_indexes
   WHERE index_name = 'PM_GRUPO_USUARIO_IDX_PM_GRUPO'
     AND table_name = 'PM_GRUPO_USUARIO';

  IF v_count_idx = 0 THEN
    EXECUTE IMMEDIATE 'CREATE INDEX  "PM_GRUPO_USUARIO_IDX_PM_GRUPO" ON  "PM_GRUPO_USUARIO" ("PM_GRUPO_ID")';
  ELSE
    dbms_output.put_line('JÁ EXISTE O PM_GRUPO_USUARIO_IDX_PM_GRUPO ');
  END IF;
END;
/
DECLARE
  v_count INTEGER;
BEGIN
  SELECT COUNT(*)
    INTO v_count
    FROM user_sequences
   WHERE sequence_name = 'PM_GRUPO_USUARIO_SEQ';

  IF v_count = 0 THEN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE "PM_GRUPO_USUARIO_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE';
  ELSE
    dbms_output.put_line('JÁ EXISTE A SEQUENCE PM_GRUPO_USUARIO_SEQ');
  END IF;
END;
/

DECLARE
  l_count INTEGER;
BEGIN
  SELECT COUNT(*)
    INTO l_count
    FROM user_triggers
   WHERE trigger_name = 'TRG_PM_GRUPO_USUARIO';

  IF l_count > 0 THEN
    EXECUTE IMMEDIATE 'drop trigger TRG_PM_GRUPO_USUARIO';
  END IF;

END;
/

CREATE TRIGGER "TRG_PM_GRUPO_USUARIO"
  BEFORE INSERT ON "PM_GRUPO_USUARIO"
  FOR EACH ROW
BEGIN
  IF :NEW."ID" IS NULL THEN
    SELECT "PM_GRUPO_USUARIO_SEQ".nextval
      INTO :NEW."ID"
      FROM sys.dual;
  END IF;
END;
/
ALTER TRIGGER  "TRG_PM_GRUPO_USUARIO" ENABLE;
/
