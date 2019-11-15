---------------------------
--New PROCEDURE
--INSTALL_RUN_RIS3_PARALLEL
---------------------------
CREATE OR REPLACE PROCEDURE "RPT_VIEW_USER_RIS"."INSTALL_RUN_RIS3_PARALLEL" 
AS 
  l_source varchar2(30) := $$PLSQL_UNIT;
BEGIN
/*----------------------------------------------------------------------------------------------------------------------*
 * INSTALL_RUN_RIS3_PARALLEL
 * Version  : 2019-43
 * Schema   : RIS_STG
 * Date     : 17-October-2019
 * Developer: Wilco Oosterom
 * 
 * Goal: Running load processes in parallel
 * 
 *----------------------------------------------------------------------------------------------------------------------*/
   grip_etl.cmd('INSTALLER '  || l_source );  

   grip_etl.cmd('RECORD_ON PF_RIS3_FILES_PAR');
          grip_etl.record_job   ('PF_RIS3_FILES_PAR','grip_flow.fruna (''PF_RIS3_FILES_AKO'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_FILES_PAR','grip_flow.fruna (''PF_RIS3_FILES_AVI'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_FILES_PAR','grip_flow.fruna (''PF_RIS3_FILES_CAP'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_FILES_PAR','grip_flow.fruna (''PF_RIS3_FILES_GAS'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_FILES_PAR','grip_flow.fruna (''PF_RIS3_FILES_GER'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_FILES_PAR','grip_flow.fruna (''PF_RIS3_FILES_KAP'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_FILES_PAR','grip_flow.fruna (''PF_RIS3_FILES_SAR'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_FILES_PAR','grip_flow.fruna (''PF_RIS3_FILES_WHS'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_FILES_PAR','grip_flow.fruna (''PF_RIS3_FILES_WOD'',''RIS_STG'')','SQLCALL');
          --grip_flow.frun_wait('PF_RIS3_STAGING_PAR','| WAITFORFLOWS RIS3_CAP,RIS3_KAP | INTERVAL 1 | SCHEMA RIS_STG');
          grip_etl.exec ('grip_flow.frun_wait(''PF_RIS3_STAGING_PAR'',''| WAITFORFLOWS PF_RIS3_FILES_AKO,PF_RIS3_FILES_AVI,PF_RIS3_FILES_CAP,PF_RIS3_FILES_GAS,PF_RIS3_FILES_GER,PF_RIS3_FILES_KAP,PF_RIS3_FILES_SAR,PF_RIS3_FILES_WHS,PF_RIS3_FILES_WOD | INTERVAL 15 | SCHEMA RIS_STG |'')');
   grip_etl.cmd('RECORD_OFF PF_RIS3_FILES_PAR');


   grip_etl.cmd('RECORD_ON PF_RIS3_STAGING_PAR');
          grip_etl.record_job   ('PF_RIS3_STAGING_PAR','grip_flow.fruna (''PF_RIS3_STAGING_AKO'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_STAGING_PAR','grip_flow.fruna (''PF_RIS3_STAGING_AVI'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_STAGING_PAR','grip_flow.fruna (''PF_RIS3_STAGING_CAP'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_STAGING_PAR','grip_flow.fruna (''PF_RIS3_STAGING_GAS'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_STAGING_PAR','grip_flow.fruna (''PF_RIS3_STAGING_GER'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_STAGING_PAR','grip_flow.fruna (''PF_RIS3_STAGING_KAP'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_STAGING_PAR','grip_flow.fruna (''PF_RIS3_STAGING_SAR'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_STAGING_PAR','grip_flow.fruna (''PF_RIS3_STAGING_WHS'',''RIS_STG'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_STAGING_PAR','grip_flow.fruna (''PF_RIS3_STAGING_WOD'',''RIS_STG'')','SQLCALL');
          --grip_flow.frun_wait('PF_RIS3_RAW_DV_PAR','| WAITFORFLOWS RIS3_STAGING_KAP,RIS3_STAGING_CAP | INTERVAL 1 | SCHEMA RIS_STG');
          grip_etl.exec ('grip_flow.frun_wait(''PF_RIS3_RDV_PARAMETER_PAR'',''| WAITFORFLOWS PF_RIS3_STAGING_AKO,PF_RIS3_STAGING_AVI,PF_RIS3_STAGING_CAP,PF_RIS3_STAGING_GAS,PF_RIS3_STAGING_GER,PF_RIS3_STAGING_KAP,PF_RIS3_STAGING_SAR,PF_RIS3_STAGING_WHS,PF_RIS3_STAGING_WOD | INTERVAL 15 | SCHEMA RIS_STG |'')');
   grip_etl.cmd('RECORD_OFF PF_RIS3_STAGING_PAR');

   grip_etl.cmd('RECORD_ON PF_RIS3_RDV_PARAMETER_PAR');
          grip_etl.record_job   ('PF_RIS3_RDV_PARAMETER_PAR','grip_flow.fruna (''PF_RIS3_RDV_PARAMETER'',''EDWH'')','SQLCALL');
          grip_etl.exec ('grip_flow.frun_wait(''PF_RIS3_RAW_DV_PAR'',''| WAITFORFLOWS PF_RIS3_RDV_PARAMETER | INTERVAL 1 | SCHEMA RIS_STG |'')');
   grip_etl.cmd('RECORD_OFF PF_RIS3_RDV_PARAMETER_PAR');


   grip_etl.cmd('RECORD_ON PF_RIS3_RAW_DV_PAR');
          grip_etl.record_job   ('PF_RIS3_RAW_DV_PAR','grip_flow.fruna (''PF_RIS3_RAW_DV_AKO'',''EDWH'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_RAW_DV_PAR','grip_flow.fruna (''PF_RIS3_RAW_DV_AVI'',''EDWH'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_RAW_DV_PAR','grip_flow.fruna (''PF_RIS3_RAW_DV_CAP'',''EDWH'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_RAW_DV_PAR','grip_flow.fruna (''PF_RIS3_RAW_DV_GAS'',''EDWH'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_RAW_DV_PAR','grip_flow.fruna (''PF_RIS3_RAW_DV_GER'',''EDWH'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_RAW_DV_PAR','grip_flow.fruna (''PF_RIS3_RAW_DV_KAP'',''EDWH'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_RAW_DV_PAR','grip_flow.fruna (''PF_RIS3_RAW_DV_SAR'',''EDWH'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_RAW_DV_PAR','grip_flow.fruna (''PF_RIS3_RAW_DV_WHS'',''EDWH'')','SQLCALL');
          grip_etl.record_job   ('PF_RIS3_RAW_DV_PAR','grip_flow.fruna (''PF_RIS3_RAW_DV_WOD'',''EDWH'')','SQLCALL');
          --grip_flow.frun_wait('PF_RIS3_BUSINESS_DV_PAR','| WAITFORFLOWS RIS3_RAW_DV_KAP,RIS3_RAW_DV_CAP | INTERVAL 1 | SCHEMA RIS_STG');
          grip_etl.exec ('grip_flow.frun_wait(''PF_RIS3_BUSINESS_DV_PAR'',''| WAITFORFLOWS PF_RIS3_RAW_DV_AKO,PF_RIS3_RAW_DV_AVI,PF_RIS3_RAW_DV_CAP,PF_RIS3_RAW_DV_GAS,PF_RIS3_RAW_DV_GER,PF_RIS3_RAW_DV_KAP,PF_RIS3_RAW_DV_SAR,PF_RIS3_RAW_DV_WHS,PF_RIS3_RAW_DV_WOD | INTERVAL 15 | SCHEMA RIS_STG |'')');
    grip_etl.cmd('RECORD_OFF PF_RIS3_RAW_DV_PAR');


   grip_etl.cmd('RECORD_ON PF_RIS3_BUSINESS_DV_PAR');
          grip_etl.record_job   ('PF_RIS3_BUSINESS_DV_PAR','grip_flow.fruna (''PF_RIS3_BUSINESS_DV'',''EDWH'')','SQLCALL');
          --grip_flow.frun_wait('PF_RIS3_DATAMARTS_PAR','| WAITFORFLOWS RIS3_BUSINESS_DV | INTERVAL 1 | SCHEMA RIS_STG');
          grip_etl.exec ('grip_flow.frun_wait(''PF_RIS3_DATAMARTS_PAR'',''| WAITFORFLOWS PF_RIS3_BUSINESS_DV | INTERVAL 15 | SCHEMA RIS_STG |'')');
   grip_etl.cmd('RECORD_OFF PF_RIS3_BUSINESS_DV_PAR');


   grip_etl.cmd('RECORD_ON PF_RIS3_DATAMARTS_PAR');
          grip_etl.record_job   ('PF_RIS3_DATAMARTS_PAR','grip_flow.fruna (''PF_RIS3_DM_MAIN'',''RIS_DM'')','SQLCALL');
   grip_etl.cmd('RECORD_OFF PF_RIS3_DATAMARTS_PAR');





/*----------------------------------------------------------------------------------------------------------------------*
 *   MAIN Flow RIS
 *----------------------------------------------------------------------------------------------------------------------*/

   grip_etl.cmd('RECORD_ON PF_RIS3_LOAD_PARALLEL');
      grip_etl.record_job  ('PF_RIS3_LOAD_PARALLEL','grip_flow.fruna (''PF_RIS3_REF_RIS_MAIN'',''REF_RIS'')','SQLCALL');  -- Refresh the (APEX maintained) Reference data
      grip_etl.record_job  ('PF_RIS3_LOAD_PARALLEL','PF_RIS3_FILES_PAR','FLOW');   --Load the Files
   grip_etl.cmd('RECORD_OFF PF_RIS3_LOAD_PARALLEL');


END;
/
