---------------------------
--New FUNCTION
--RIS3_TEST_FLOW
---------------------------
CREATE OR REPLACE FUNCTION "RPT_VIEW_USER_RIS"."RIS3_TEST_FLOW" (p_flow IN varchar) RETURN NUMBER is
/*----------------------------------------------------------------------------------------------------------------------*
 * RIS3_TEST_FLOW
 * Version: 1.00.50
 * Schema: RIS_STG
 * Date 05-July-2019
 * Developer: Wilco Oosterom
 * 
 * Goal: Test if a previous flow ended in error. Use the result in conjunction wit the flowname and rownum
 * to determnine if rows may be passed to the next level
 * 
 *----------------------------------------------------------------------------------------------------------------------*/

  l_return NUMBER DEFAULT null;
BEGIN 
  SELECT 0 INTO l_return FROM ris3_parallel_monitor_v WHERE top_level = p_flow AND status = 'E_error';
  RETURN  l_return;
  EXCEPTION WHEN no_data_found THEN
    RETURN 999999999999999;
END;
/
