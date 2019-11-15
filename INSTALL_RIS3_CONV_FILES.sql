---------------------------
--New PROCEDURE
--INSTALL_RIS3_CONV_FILES
---------------------------
CREATE OR REPLACE PROCEDURE "RPT_VIEW_USER_RIS"."INSTALL_RIS3_CONV_FILES" AS 
  l_source varchar2(30) := $$PLSQL_UNIT;
BEGIN
/*----------------------------------------------------------------------------------------------------------------------*
 * INSTALL_RIS3_CONV_FILES
 * Version  : 2019-47
 * Schema   : RIS_STG
 * Date     : 14-November-2019
 * Developer: Wilco Oosterom
 * 
 * Goal: Running load processes in parallel
 * 
 *----------------------------------------------------------------------------------------------------------------------*/
   grip_etl.cmd('INSTALLER '  || l_source );  

   grip_etl.cmd('RECORD_ON PF_RIS3_CONV_ITT_START');
      -- Log the run  
          grip_etl.record_job  ('PF_RIS3_CONV_ITT_START','DELETE FROM RIS3_CONVERSION_RUNS WHERE "Run" is null' ,'SQLCALL');  
          grip_etl.record_job  ('PF_RIS3_CONV_ITT_START','insert into RIS3_CONVERSION_RUNS select CAST(NULL AS VARCHAR2(6 char)), sysdate, cast(NULL as date) FROM dual' ,'SQLCALL');  
      -- start the run
          --  grip_etl.record_job  ('PF_RIS3_CONV_ITT_START','grip_flow.fruna (''PF_RIS3_FILES_PAR'',''RIS_STG'')','SQLCALL');  
          grip_etl.record_job  ('PF_RIS3_CONV_ITT_START','PF_RIS3_CVFILES_PAR','FLOW');
   grip_etl.cmd('RECORD_OFF PF_RIS3_CONV_ITT_START');

   grip_etl.cmd('RECORD_ON PF_RIS3_CVFILES_PAR');
          grip_etl.record_job   ('PF_RIS3_CVFILES_PAR','grip_flow.fruna (''PF_RIS3_FILES_AKO'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_CVFILES_PAR','grip_flow.fruna (''PF_RIS3_FILES_AVI'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_CVFILES_PAR','grip_flow.fruna (''PF_RIS3_FILES_CAP'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_CVFILES_PAR','grip_flow.fruna (''PF_RIS3_FILES_GAS'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_CVFILES_PAR','grip_flow.fruna (''PF_RIS3_FILES_GER'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_CVFILES_PAR','grip_flow.fruna (''PF_RIS3_FILES_KAP'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_CVFILES_PAR','grip_flow.fruna (''PF_RIS3_FILES_SAR'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_CVFILES_PAR','grip_flow.fruna (''PF_RIS3_FILES_WHS'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_CVFILES_PAR','grip_flow.fruna (''PF_RIS3_FILES_WOD'',''RIS_STG'')','SQLCALL');
          grip_etl.exec ('grip_flow.frun_wait(''PF_RIS3_CVSTAGING_PAR'',''| WAITFORFLOWS PF_RIS3_FILES_AKO,PF_RIS3_FILES_AVI,PF_RIS3_FILES_CAP,PF_RIS3_FILES_GAS,PF_RIS3_FILES_GER,PF_RIS3_FILES_KAP,PF_RIS3_FILES_SAR,PF_RIS3_FILES_WHS,PF_RIS3_FILES_WOD | INTERVAL 120 | SCHEMA RIS_STG |'')');
   grip_etl.cmd('RECORD_OFF PF_RIS3_CVFILES_PAR');


   grip_etl.cmd('RECORD_ON PF_RIS3_CVSTAGING_PAR');
          grip_etl.record_job   ('PF_RIS3_CVSTAGING_PAR','grip_flow.fruna (''PF_RIS3_STAGING_AKO'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_CVSTAGING_PAR','grip_flow.fruna (''PF_RIS3_STAGING_AVI'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_CVSTAGING_PAR','grip_flow.fruna (''PF_RIS3_STAGING_CAP'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_CVSTAGING_PAR','grip_flow.fruna (''PF_RIS3_STAGING_GAS'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_CVSTAGING_PAR','grip_flow.fruna (''PF_RIS3_STAGING_GER'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_CVSTAGING_PAR','grip_flow.fruna (''PF_RIS3_STAGING_KAP'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_CVSTAGING_PAR','grip_flow.fruna (''PF_RIS3_STAGING_SAR'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_CVSTAGING_PAR','grip_flow.fruna (''PF_RIS3_STAGING_WHS'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_CVSTAGING_PAR','grip_flow.fruna (''PF_RIS3_STAGING_WOD'',''RIS_STG'')','SQLCALL');
          grip_etl.exec ('grip_flow.frun_wait(''PF_RIS3_RAW_CVDV_PAR'',''| WAITFORFLOWS PF_RIS3_STAGING_AKO,PF_RIS3_STAGING_AVI,PF_RIS3_STAGING_CAP,PF_RIS3_STAGING_GAS,PF_RIS3_STAGING_GER,PF_RIS3_STAGING_KAP,PF_RIS3_STAGING_SAR,PF_RIS3_STAGING_WHS,PF_RIS3_STAGING_WOD | INTERVAL 120 | SCHEMA RIS_STG |'')');
   grip_etl.cmd('RECORD_OFF PF_RIS3_CVSTAGING_PAR');


   grip_etl.cmd('RECORD_ON PF_RIS3_RAW_CVDV_PAR');
          grip_etl.record_job   ('PF_RIS3_RAW_CVDV_PAR','grip_flow.fruna (''PF_RIS3_RAW_DV_AKO'',''EDWH'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_RAW_CVDV_PAR','grip_flow.fruna (''PF_RIS3_RAW_DV_AVI'',''EDWH'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_RAW_CVDV_PAR','grip_flow.fruna (''PF_RIS3_RAW_DV_CAP'',''EDWH'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_RAW_CVDV_PAR','grip_flow.fruna (''PF_RIS3_RAW_DV_GAS'',''EDWH'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_RAW_CVDV_PAR','grip_flow.fruna (''PF_RIS3_RAW_DV_GER'',''EDWH'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_RAW_CVDV_PAR','grip_flow.fruna (''PF_RIS3_RAW_DV_KAP'',''EDWH'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_RAW_CVDV_PAR','grip_flow.fruna (''PF_RIS3_RAW_DV_SAR'',''EDWH'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_RAW_CVDV_PAR','grip_flow.fruna (''PF_RIS3_RAW_DV_WHS'',''EDWH'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_RAW_CVDV_PAR','grip_flow.fruna (''PF_RIS3_RAW_DV_WOD'',''EDWH'')','SQLCALL');
          grip_etl.exec ('grip_flow.frun_wait(''PF_RIS3_CONV_ITT_END'',''| WAITFORFLOWS PF_RIS3_RAW_DV_AKO,PF_RIS3_RAW_DV_AVI,PF_RIS3_RAW_DV_CAP,PF_RIS3_RAW_DV_GAS,PF_RIS3_RAW_DV_GER,PF_RIS3_RAW_DV_KAP,PF_RIS3_RAW_DV_SAR,PF_RIS3_RAW_DV_WHS,PF_RIS3_RAW_DV_WOD | INTERVAL 120 | SCHEMA RIS_STG |'')');
   grip_etl.cmd('RECORD_OFF PF_RIS3_RAW_CVDV_PAR');

   grip_etl.cmd('RECORD_ON PF_RIS3_CONV_ITT_END');
      -- Record the run end
          grip_etl.record_job  ('PF_RIS3_CONV_ITT_END','update RIS3_CONVERSION_RUNS set "End Date Time" = sysdate , "Run"= (SELECT substr(file_name,8,6), sysdate, NULL FROM BUP_CAP_PRODUCT_HIERARCHY WHERE ROWNUM =1) WHERE "Run" IS NULL' ,'SQLCALL');  -- Refresh the (APEX maintained) Reference data
      -- start the next run
          grip_etl.record_job  ('PF_RIS3_CONV_ITT_END','grip_flow.fruna (''PF_RIS3_CONV_ITT_START'',''RIS_STG'')','SQLCALL');  
        --  grip_etl.record_job  ('PF_RIS3_CONV_ITT_END','PF_RIS3_CONV_ITT_START','FLOW');

   grip_etl.cmd('RECORD_OFF PF_RIS3_CONV_ITT_END');
END;
/
