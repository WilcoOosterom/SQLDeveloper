---------------------------
--New PROCEDURE
--REVOKE_DATAVIRT
---------------------------
CREATE OR REPLACE PROCEDURE "RPT_VIEW_USER_RIS"."REVOKE_DATAVIRT" AS
BEGIN
DECLARE 
/*----------------------------------------------------------------------------------------------------------------------*
 * REVOKE_DATAVIRT
 * Version: 1.00.40
 * Schema: ANY
 * Date 19-June-2019
 * Developer: Wilco Oosterom
 *
 * Goal: verwijderen datavirt privileges tbv development
 *
 *----------------------------------------------------------------------------------------------------------------------*/
    CURSOR c_sql IS SELECT 'REVOKE SELECT ON '||table_name||' from datavirt' stmt
              FROM ALL_tab_PRIVS t
              WHERE table_schema = USER
              AND grantee = 'DATAVIRT';

BEGIN 
	dbms_output.enable (1000000);
   FOR r_sql IN c_sql
   LOOP 
      dbms_output.put_line(r_sql.stmt);
      EXECUTE IMMEDIATE r_sql.stmt;

   END LOOP;
   dbms_output.put_line('Done');
END;
END;
/
