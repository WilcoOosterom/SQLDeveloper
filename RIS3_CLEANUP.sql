---------------------------
--New PROCEDURE
--RIS3_CLEANUP
---------------------------
CREATE OR REPLACE PROCEDURE "RPT_VIEW_USER_RIS"."RIS3_CLEANUP" (p_DATE IN DATE DEFAULT sysdate)
AS
BEGIN
/*----------------------------------------------------------------------------------------------------------------------*
 * RIS3_CLEANUP
 * Version: 1.00.50 
 * Schema: RIS_STG
 * Date 11-July-2019
 * Developer: Wilco Oosterom
 * 
 * Goal: Drop remnants of failed grip flows after 7 days
 * 
 *----------------------------------------------------------------------------------------------------------------------*/

      FOR L_SQL IN (SELECT TABLE_NAME
                    FROM user_objects o
                    JOIN user_tables  t
                    ON   o.object_name = t.table_name AND o.object_type = 'TABLE'
                    WHERE regexp_like(table_name,'^GRIP_[[:alpha:]]{3}_[[:digit:]]{10}$')
                    AND o.last_ddl_time < p_DATE-7)
      LOOP
           EXECUTE IMMEDIATE  'DROP TABLE '||l_sql.table_name;
      END LOOP;

END;
/
