---------------------------
--New VIEW
--MD_RUNDATA_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."MD_RUNDATA_V" 
 ( "USERNAME", "TOP_LEVEL", "PARENT", "CHILD", "START_DT", "DURATION", "MINUTES"
  )  AS 
  SELECT username
,      top_level
,      parent
,      child
,      START_DT
,      to_char(trunc(sysdate)+ (stop_dt - start_dt),'HH24:mi:ss') Duration
,      to_number(To_char((stop_dt - start_dt) * (60*24), '9999.99'))  minutes
FROM GRIP_JOB_RUN_hist 
WHERE top_level IN (
  'PF_RIS3_FILES_AKO'
, 'PF_RIS3_FILES_AVI'
, 'PF_RIS3_FILES_CAP'
, 'PF_RIS3_FILES_GAS'
, 'PF_RIS3_FILES_GER'
, 'PF_RIS3_FILES_KAP'
, 'PF_RIS3_FILES_SAR'
, 'PF_RIS3_FILES_WHS'
, 'PF_RIS3_FILES_WOD'
, 'PF_RIS3_STAGING_AKO'
, 'PF_RIS3_STAGING_AVI'
, 'PF_RIS3_STAGING_CAP'
, 'PF_RIS3_STAGING_GAS'
, 'PF_RIS3_STAGING_GER'
, 'PF_RIS3_STAGING_KAP'
, 'PF_RIS3_STAGING_SAR'
, 'PF_RIS3_STAGING_WHS'
, 'PF_RIS3_STAGING_WOD'
, 'PF_RIS3_RAW_DV_AKO'
, 'PF_RIS3_RAW_DV_AVI'
, 'PF_RIS3_RAW_DV_CAP'
, 'PF_RIS3_RAW_DV_GAS'
, 'PF_RIS3_RAW_DV_GER'
, 'PF_RIS3_RAW_DV_KAP'
, 'PF_RIS3_RAW_DV_SAR'
, 'PF_RIS3_RAW_DV_WHS'
, 'PF_RIS3_RAW_DV_WOD'
, 'PF_RIS3_BUSINESS_DV'
,'PF_RIS3_DM_MAIN'
, 'PF_RIS3_DM_DIMENSIONS'
, 'PF_RIS3_DM_FACTS'
)  
AND start_dt > SYSDATE -0.25
--AND child LIKE '%wait%' 
ORDER BY start_dt asc;
