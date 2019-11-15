---------------------------
--New PROCEDURE
--INSTALL_RIS3_STG_MAIN
---------------------------
CREATE OR REPLACE PROCEDURE "RPT_VIEW_USER_RIS"."INSTALL_RIS3_STG_MAIN" 
AS 
  l_source varchar2(30) := $$PLSQL_UNIT;
BEGIN
/*----------------------------------------------------------------------------------------------------------------------*
 * INSTALL_RIS3_STG_MAIN
 * Version   : 2019-41
 * Schema    : RIS_STG
 * Date      : 02-October-2019
 * Developer : Wilco Oosterom
 * 
 * Goal: Laden van informatie uit  POS, PRH and ART files in hun target tabellen
 * 
 *----------------------------------------------------------------------------------------------------------------------*/
   grip_etl.cmd('INSTALLER '  || l_source );  

   grip_etl.cmd('RECORD_ON PF_RIS3_CHECK_AKO');
      grip_etl.log_info ('START check load AKO');
         grip_etl.trunc_insert('MD_BUP_AKO_FILE_V','MD_BUP_AKO_FILE',' | LOG_INFO Check load metadata AKO. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_AKO_FILESET_V','MD_BUP_AKO_FILESET',' | LOG_INFO Check load metadata AKO. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_AKO_AMOUNTS_V','MD_BUP_AKO_AMOUNTS',' | LOG_INFO Check load metadata AKO. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_AKO_FLIGHTINFO_V','MD_BUP_AKO_FLIGHTINFO',' | LOG_INFO Check load metadata AKO. [Version 2019-41] Generated for GRIP | ');
      grip_etl.log_info ('END check load AKO');
   grip_etl.cmd('RECORD_OFF PF_RIS3_CHECK_AKO');

   grip_etl.cmd('RECORD_ON PF_RIS3_CHECK_AVI');
      grip_etl.log_info ('START check load AVI');
         grip_etl.trunc_insert('MD_BUP_AVI_FILE_V','MD_BUP_AVI_FILE',' | LOG_INFO Check load metadata AVI. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_AVI_FILESET_V','MD_BUP_AVI_FILESET',' | LOG_INFO Check load metadata AVI. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_AVI_AMOUNTS_V','MD_BUP_AVI_AMOUNTS',' | LOG_INFO Check load metadata AVI. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_AVI_FLIGHTINFO_V','MD_BUP_AVI_FLIGHTINFO',' | LOG_INFO Check load metadata AVI. [Version 2019-41] Generated for GRIP | ');
      grip_etl.log_info ('END check load AVI');
   grip_etl.cmd('RECORD_OFF PF_RIS3_CHECK_AVI');

   grip_etl.cmd('RECORD_ON PF_RIS3_CHECK_CAP');
      grip_etl.log_info ('START check load CAP');
         grip_etl.trunc_insert('MD_BUP_CAP_FILE_V','MD_BUP_CAP_FILE',' | LOG_INFO Check load metadata CAP. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_CAP_FILESET_V','MD_BUP_CAP_FILESET',' | LOG_INFO Check load metadata CAP. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_CAP_AMOUNTS_V','MD_BUP_CAP_AMOUNTS',' | LOG_INFO Check load metadata CAP. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_CAP_FLIGHTINFO_V','MD_BUP_CAP_FLIGHTINFO',' | LOG_INFO Check load metadata CAP. [Version 2019-41] Generated for GRIP | ');
      grip_etl.log_info ('END check load CAP');
   grip_etl.cmd('RECORD_OFF PF_RIS3_CHECK_CAP');

   grip_etl.cmd('RECORD_ON PF_RIS3_CHECK_GAS');
      grip_etl.log_info ('START check load GAS');
         grip_etl.trunc_insert('MD_BUP_GAS_FILE_V','MD_BUP_GAS_FILE',' | LOG_INFO Check load metadata GAS. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_GAS_FILESET_V','MD_BUP_GAS_FILESET',' | LOG_INFO Check load metadata GAS. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_GAS_AMOUNTS_V','MD_BUP_GAS_AMOUNTS',' | LOG_INFO Check load metadata GAS. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_GAS_FLIGHTINFO_V','MD_BUP_GAS_FLIGHTINFO',' | LOG_INFO Check load metadata GAS. [Version 2019-41] Generated for GRIP | ');
      grip_etl.log_info ('END check load GAS');
   grip_etl.cmd('RECORD_OFF PF_RIS3_CHECK_GAS');

   grip_etl.cmd('RECORD_ON PF_RIS3_CHECK_GER');
      grip_etl.log_info ('START check load GER');
         grip_etl.trunc_insert('MD_BUP_GER_FILE_V','MD_BUP_GER_FILE',' | LOG_INFO Check load metadata GER. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_GER_FILESET_V','MD_BUP_GER_FILESET',' | LOG_INFO Check load metadata GER. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_GER_AMOUNTS_V','MD_BUP_GER_AMOUNTS',' | LOG_INFO Check load metadata GER. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_GER_FLIGHTINFO_V','MD_BUP_GER_FLIGHTINFO',' | LOG_INFO Check load metadata GER. [Version 2019-41] Generated for GRIP | ');
      grip_etl.log_info ('END check load GER');
   grip_etl.cmd('RECORD_OFF PF_RIS3_CHECK_GER');

   grip_etl.cmd('RECORD_ON PF_RIS3_CHECK_KAP');
      grip_etl.log_info ('START check load KAP');
         grip_etl.trunc_insert('MD_BUP_KAP_FILE_V','MD_BUP_KAP_FILE',' | LOG_INFO Check load metadata KAP. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_KAP_FILESET_V','MD_BUP_KAP_FILESET',' | LOG_INFO Check load metadata KAP. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_KAP_AMOUNTS_V','MD_BUP_KAP_AMOUNTS',' | LOG_INFO Check load metadata KAP. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_KAP_FLIGHTINFO_V','MD_BUP_KAP_FLIGHTINFO',' | LOG_INFO Check load metadata KAP. [Version 2019-41] Generated for GRIP | ');
      grip_etl.log_info ('END check load KAP');
   grip_etl.cmd('RECORD_OFF PF_RIS3_CHECK_KAP');

   grip_etl.cmd('RECORD_ON PF_RIS3_CHECK_SAR');
      grip_etl.log_info ('START check load SAR');
         grip_etl.trunc_insert('MD_BUP_SAR_FILE_V','MD_BUP_SAR_FILE',' | LOG_INFO Check load metadata SAR. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_SAR_FILESET_V','MD_BUP_SAR_FILESET',' | LOG_INFO Check load metadata SAR. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_SAR_AMOUNTS_V','MD_BUP_SAR_AMOUNTS',' | LOG_INFO Check load metadata SAR. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_SAR_FLIGHTINFO_V','MD_BUP_SAR_FLIGHTINFO',' | LOG_INFO Check load metadata SAR. [Version 2019-41] Generated for GRIP | ');
      grip_etl.log_info ('END check load SAR');
   grip_etl.cmd('RECORD_OFF PF_RIS3_CHECK_SAR');

   grip_etl.cmd('RECORD_ON PF_RIS3_CHECK_WHS');
      grip_etl.log_info ('START check load WHS');
         grip_etl.trunc_insert('MD_BUP_WHS_FILE_V','MD_BUP_WHS_FILE',' | LOG_INFO Check load metadata WHS. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_WHS_FILESET_V','MD_BUP_WHS_FILESET',' | LOG_INFO Check load metadata WHS. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_WHS_AMOUNTS_V','MD_BUP_WHS_AMOUNTS',' | LOG_INFO Check load metadata WHS. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_WHS_FLIGHTINFO_V','MD_BUP_WHS_FLIGHTINFO',' | LOG_INFO Check load metadata WHS. [Version 2019-41] Generated for GRIP | ');
      grip_etl.log_info ('END check load WHS');
   grip_etl.cmd('RECORD_OFF PF_RIS3_CHECK_WHS');

   grip_etl.cmd('RECORD_ON PF_RIS3_CHECK_WOD');
      grip_etl.log_info ('START check load WOD');
         grip_etl.trunc_insert('MD_BUP_WOD_FILE_V','MD_BUP_WOD_FILE',' | LOG_INFO Check load metadata WOD. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_WOD_FILESET_V','MD_BUP_WOD_FILESET',' | LOG_INFO Check load metadata WOD. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_WOD_AMOUNTS_V','MD_BUP_WOD_AMOUNTS',' | LOG_INFO Check load metadata WOD. [Version 2019-41] Generated for GRIP | ');
         grip_etl.trunc_insert('MD_BUP_WOD_FLIGHTINFO_V','MD_BUP_WOD_FLIGHTINFO',' | LOG_INFO Check load metadata WOD. [Version 2019-41] Generated for GRIP | ');
      grip_etl.log_info ('END check load WOD');
   grip_etl.cmd('RECORD_OFF PF_RIS3_CHECK_WOD');


   grip_etl.cmd('RECORD_ON PF_RIS3_STAGING_AKO');
      grip_etl.log_info ('START load AKO');
      --grip_etl.record_job  ('FILES_AKO','ccdw_ris.begin_job(''RIS3AKO'')','SQLCALL'); 
         grip_etl.trunc_insert('FLH_AKO_POS_FLIGHT_XT_V','BUP_AKO_POS_FLIGHT','| LOG_INFO POS file AKO |');
         grip_etl.trunc_insert('FLH_AKO_POS_LINE_ITEM_XT_V','BUP_AKO_POS_LINE_ITEM','| LOG_INFO POS file AKO |');
         grip_etl.trunc_insert('FLH_AKO_POS_PAYMENT_XT_V','BUP_AKO_POS_PAYMENT','| LOG_INFO POS file AKO |');
         grip_etl.trunc_insert('FLH_AKO_POS_MARKETING_ATR_XT_V','BUP_AKO_POS_MARKETING_ATR','| LOG_INFO POS file AKO |');
         grip_etl.trunc_insert('FLH_AKO_PRH_INF_XT_V','BUP_AKO_PRODUCT_HIERARCHY','| LOG_INFO PRH file AKO |');
         grip_etl.trunc_insert('FLH_AKO_ART_INF_XT_V','BUP_AKO_ARTICLE','| LOG_INFO ART file AKO |');
         grip_etl.trunc_insert('FLH_AKO_ART_METADATA_V','FLH_AKO_METADATA', '| LOG_INFO ART Metadata');
         grip_etl.insert_append('FLH_AKO_POS_METADATA_V','FLH_AKO_METADATA', '| LOG_INFO POS Metadata');
         grip_etl.insert_append('FLH_AKO_PRH_METADATA_V','FLH_AKO_METADATA', '| LOG_INFO PRH Metadata');
         grip_etl.record_job  ('PF_RIS3_STAGING_AKO','PF_RIS3_CHECK_AKO','FLOW');
      --grip_etl.record_job  ('FILES_AKO','ccdw_ris.end_job(''RIS3AKO'')','SQLCALL');
      grip_etl.log_info ('END load AKO');
   grip_etl.cmd('RECORD_OFF PF_RIS3_STAGING_AKO');

   grip_etl.cmd('RECORD_ON PF_RIS3_STAGING_AVI');
      grip_etl.log_info ('START load AVI');
      --grip_etl.record_job  ('FILES_AVI','ccdw_ris.begin_job(''RIS3AVI'')','SQLCALL'); 
         grip_etl.trunc_insert('FLH_AVI_POS_FLIGHT_XT_V','BUP_AVI_POS_FLIGHT','| LOG_INFO POS file AVI |');
         grip_etl.trunc_insert('FLH_AVI_POS_LINE_ITEM_XT_V','BUP_AVI_POS_LINE_ITEM','| LOG_INFO POS file AVI |');
         grip_etl.trunc_insert('FLH_AVI_POS_PAYMENT_XT_V','BUP_AVI_POS_PAYMENT','| LOG_INFO POS file AVI |');
         grip_etl.trunc_insert('FLH_AVI_POS_MARKETING_ATR_XT_V','BUP_AVI_POS_MARKETING_ATR','| LOG_INFO POS file AVI |');
         grip_etl.trunc_insert('FLH_AVI_PRH_INF_XT_V','BUP_AVI_PRODUCT_HIERARCHY','| LOG_INFO PRH file AVI |');
         grip_etl.trunc_insert('FLH_AVI_ART_INF_XT_V','BUP_AVI_ARTICLE','| LOG_INFO ART file AVI |');
         grip_etl.trunc_insert('FLH_AVI_ART_METADATA_V','FLH_AVI_METADATA', '| LOG_INFO ART Metadata');
         grip_etl.insert_append('FLH_AVI_POS_METADATA_V','FLH_AVI_METADATA', '| LOG_INFO POS Metadata');
         grip_etl.insert_append('FLH_AVI_PRH_METADATA_V','FLH_AVI_METADATA', '| LOG_INFO PRH Metadata');
         grip_etl.record_job  ('PF_RIS3_STAGING_AVI','PF_RIS3_CHECK_AVI','FLOW');
      --grip_etl.record_job  ('FILES_AVI','ccdw_ris.end_job(''RIS3AVI'')','SQLCALL');
      grip_etl.log_info ('END load AVI');
   grip_etl.cmd('RECORD_OFF PF_RIS3_STAGING_AVI');

   grip_etl.cmd('RECORD_ON PF_RIS3_STAGING_CAP');
      grip_etl.log_info ('START load CAP');
      --grip_etl.record_job  ('FILES_CAP','ccdw_ris.begin_job(''RIS3CAP'')','SQLCALL'); 
         grip_etl.trunc_insert('FLH_CAP_POS_FLIGHT_XT_V','BUP_CAP_POS_FLIGHT','| LOG_INFO POS file CAP |');
         grip_etl.trunc_insert('FLH_CAP_POS_LINE_ITEM_XT_V','BUP_CAP_POS_LINE_ITEM','| LOG_INFO POS file CAP |');
         grip_etl.trunc_insert('FLH_CAP_POS_PAYMENT_XT_V','BUP_CAP_POS_PAYMENT','| LOG_INFO POS file CAP |');
         grip_etl.trunc_insert('FLH_CAP_POS_MARKETING_ATR_XT_V','BUP_CAP_POS_MARKETING_ATR','| LOG_INFO POS file CAP |');
         grip_etl.trunc_insert('FLH_CAP_PRH_INF_XT_V','BUP_CAP_PRODUCT_HIERARCHY','| LOG_INFO PRH file CAP |');
         grip_etl.trunc_insert('FLH_CAP_ART_INF_XT_V','BUP_CAP_ARTICLE','| LOG_INFO ART file CAP |');
         grip_etl.trunc_insert('FLH_CAP_ART_METADATA_V','FLH_CAP_METADATA', '| LOG_INFO ART Metadata');
         grip_etl.insert_append('FLH_CAP_POS_METADATA_V','FLH_CAP_METADATA', '| LOG_INFO POS Metadata');
         grip_etl.insert_append('FLH_CAP_PRH_METADATA_V','FLH_CAP_METADATA', '| LOG_INFO PRH Metadata');
         grip_etl.record_job  ('PF_RIS3_STAGING_CAP','PF_RIS3_CHECK_CAP','FLOW');
      --grip_etl.record_job  ('FILES_CAP','ccdw_ris.end_job(''RIS3CAP'')','SQLCALL');
      grip_etl.log_info ('END load CAP');
   grip_etl.cmd('RECORD_OFF PF_RIS3_STAGING_CAP');

   grip_etl.cmd('RECORD_ON PF_RIS3_STAGING_GAS');
      grip_etl.log_info ('START load GAS');
      --grip_etl.record_job  ('FILES_GAS','ccdw_ris.begin_job(''RIS3GAS'')','SQLCALL'); 
         grip_etl.trunc_insert('FLH_GAS_POS_FLIGHT_XT_V','BUP_GAS_POS_FLIGHT','| LOG_INFO POS file GAS |');
         grip_etl.trunc_insert('FLH_GAS_POS_LINE_ITEM_XT_V','BUP_GAS_POS_LINE_ITEM','| LOG_INFO POS file GAS |');
         grip_etl.trunc_insert('FLH_GAS_POS_PAYMENT_XT_V','BUP_GAS_POS_PAYMENT','| LOG_INFO POS file GAS |');
         grip_etl.trunc_insert('FLH_GAS_POS_MARKETING_ATR_XT_V','BUP_GAS_POS_MARKETING_ATR','| LOG_INFO POS file GAS |');
         grip_etl.trunc_insert('FLH_GAS_PRH_INF_XT_V','BUP_GAS_PRODUCT_HIERARCHY','| LOG_INFO PRH file GAS |');
         grip_etl.trunc_insert('FLH_GAS_ART_INF_XT_V','BUP_GAS_ARTICLE','| LOG_INFO ART file GAS |');
         grip_etl.trunc_insert('FLH_GAS_ART_METADATA_V','FLH_GAS_METADATA', '| LOG_INFO ART Metadata');
         grip_etl.insert_append('FLH_GAS_POS_METADATA_V','FLH_GAS_METADATA', '| LOG_INFO POS Metadata');
         grip_etl.insert_append('FLH_GAS_PRH_METADATA_V','FLH_GAS_METADATA', '| LOG_INFO PRH Metadata');
         grip_etl.record_job  ('PF_RIS3_STAGING_GAS','PF_RIS3_CHECK_GAS','FLOW');
      --grip_etl.record_job  ('FILES_GAS','ccdw_ris.end_job(''RIS3GAS'')','SQLCALL');
      grip_etl.log_info ('END load GAS');
   grip_etl.cmd('RECORD_OFF PF_RIS3_STAGING_GAS');

   grip_etl.cmd('RECORD_ON PF_RIS3_STAGING_GER');
      grip_etl.log_info ('START load GER');
      --grip_etl.record_job  ('FILES_GER','ccdw_ris.begin_job(''RIS3GER'')','SQLCALL'); 
         grip_etl.trunc_insert('FLH_GER_POS_FLIGHT_XT_V','BUP_GER_POS_FLIGHT','| LOG_INFO POS file GER |');
         grip_etl.trunc_insert('FLH_GER_POS_LINE_ITEM_XT_V','BUP_GER_POS_LINE_ITEM','| LOG_INFO POS file GER |');
         grip_etl.trunc_insert('FLH_GER_POS_PAYMENT_XT_V','BUP_GER_POS_PAYMENT','| LOG_INFO POS file GER |');
         grip_etl.trunc_insert('FLH_GER_POS_MARKETING_ATR_XT_V','BUP_GER_POS_MARKETING_ATR','| LOG_INFO POS file GER |');
         grip_etl.trunc_insert('FLH_GER_PRH_INF_XT_V','BUP_GER_PRODUCT_HIERARCHY','| LOG_INFO PRH file GER |');
         grip_etl.trunc_insert('FLH_GER_ART_INF_XT_V','BUP_GER_ARTICLE','| LOG_INFO ART file GER |');
         grip_etl.trunc_insert('FLH_GER_ART_METADATA_V','FLH_GER_METADATA', '| LOG_INFO ART Metadata');
         grip_etl.insert_append('FLH_GER_POS_METADATA_V','FLH_GER_METADATA', '| LOG_INFO POS Metadata');
         grip_etl.insert_append('FLH_GER_PRH_METADATA_V','FLH_GER_METADATA', '| LOG_INFO PRH Metadata');
         grip_etl.record_job  ('PF_RIS3_STAGING_GER','PF_RIS3_CHECK_GER','FLOW');
      --grip_etl.record_job  ('FILES_GER','ccdw_ris.end_job(''RIS3GER'')','SQLCALL');
      grip_etl.log_info ('END load GER');
   grip_etl.cmd('RECORD_OFF PF_RIS3_STAGING_GER');

   grip_etl.cmd('RECORD_ON PF_RIS3_STAGING_KAP');
      grip_etl.log_info ('START load KAP');
      --grip_etl.record_job  ('FILES_KAP','ccdw_ris.begin_job(''RIS3KAP'')','SQLCALL'); 
         grip_etl.trunc_insert('FLH_KAP_POS_FLIGHT_XT_V','BUP_KAP_POS_FLIGHT','| LOG_INFO POS file KAP |');
         grip_etl.trunc_insert('FLH_KAP_POS_LINE_ITEM_XT_V','BUP_KAP_POS_LINE_ITEM','| LOG_INFO POS file KAP |');
         grip_etl.trunc_insert('FLH_KAP_POS_PAYMENT_XT_V','BUP_KAP_POS_PAYMENT','| LOG_INFO POS file KAP |');
         grip_etl.trunc_insert('FLH_KAP_POS_MARKETING_ATR_XT_V','BUP_KAP_POS_MARKETING_ATR','| LOG_INFO POS file KAP |');
         grip_etl.trunc_insert('FLH_KAP_PRH_INF_XT_V','BUP_KAP_PRODUCT_HIERARCHY','| LOG_INFO PRH file KAP |');
         grip_etl.trunc_insert('FLH_KAP_ART_INF_XT_V','BUP_KAP_ARTICLE','| LOG_INFO ART file KAP |');
         grip_etl.trunc_insert('FLH_KAP_ART_METADATA_V','FLH_KAP_METADATA', '| LOG_INFO ART Metadata');
         grip_etl.insert_append('FLH_KAP_POS_METADATA_V','FLH_KAP_METADATA', '| LOG_INFO POS Metadata');
         grip_etl.insert_append('FLH_KAP_PRH_METADATA_V','FLH_KAP_METADATA', '| LOG_INFO PRH Metadata');
         grip_etl.record_job  ('PF_RIS3_STAGING_KAP','PF_RIS3_CHECK_KAP','FLOW');
      --grip_etl.record_job  ('FILES_KAP','ccdw_ris.end_job(''RIS3KAP'')','SQLCALL');
      grip_etl.log_info ('END load KAP');
   grip_etl.cmd('RECORD_OFF PF_RIS3_STAGING_KAP');

   grip_etl.cmd('RECORD_ON PF_RIS3_STAGING_SAR');
      grip_etl.log_info ('START load SAR');
      --grip_etl.record_job  ('FILES_SAR','ccdw_ris.begin_job(''RIS3SAR'')','SQLCALL'); 
         grip_etl.trunc_insert('FLH_SAR_POS_FLIGHT_XT_V','BUP_SAR_POS_FLIGHT','| LOG_INFO POS file SAR |');
         grip_etl.trunc_insert('FLH_SAR_POS_LINE_ITEM_XT_V','BUP_SAR_POS_LINE_ITEM','| LOG_INFO POS file SAR |');
         grip_etl.trunc_insert('FLH_SAR_POS_PAYMENT_XT_V','BUP_SAR_POS_PAYMENT','| LOG_INFO POS file SAR |');
         grip_etl.trunc_insert('FLH_SAR_POS_MARKETING_ATR_XT_V','BUP_SAR_POS_MARKETING_ATR','| LOG_INFO POS file SAR |');
         grip_etl.trunc_insert('FLH_SAR_PRH_INF_XT_V','BUP_SAR_PRODUCT_HIERARCHY','| LOG_INFO PRH file SAR |');
         grip_etl.trunc_insert('FLH_SAR_ART_INF_XT_V','BUP_SAR_ARTICLE','| LOG_INFO ART file SAR |');
         grip_etl.trunc_insert('FLH_SAR_ART_METADATA_V','FLH_SAR_METADATA', '| LOG_INFO ART Metadata');
         grip_etl.insert_append('FLH_SAR_POS_METADATA_V','FLH_SAR_METADATA', '| LOG_INFO POS Metadata');
         grip_etl.insert_append('FLH_SAR_PRH_METADATA_V','FLH_SAR_METADATA', '| LOG_INFO PRH Metadata');
         grip_etl.record_job  ('PF_RIS3_STAGING_SAR','PF_RIS3_CHECK_SAR','FLOW');
      --grip_etl.record_job  ('FILES_SAR','ccdw_ris.end_job(''RIS3SAR'')','SQLCALL');
      grip_etl.log_info ('END load SAR');
   grip_etl.cmd('RECORD_OFF PF_RIS3_STAGING_SAR');

   grip_etl.cmd('RECORD_ON PF_RIS3_STAGING_WHS');
      grip_etl.log_info ('START load WHS');
      --grip_etl.record_job  ('FILES_WHS','ccdw_ris.begin_job(''RIS3WHS'')','SQLCALL'); 
         grip_etl.trunc_insert('FLH_WHS_POS_FLIGHT_XT_V','BUP_WHS_POS_FLIGHT','| LOG_INFO POS file WHS |');
         grip_etl.trunc_insert('FLH_WHS_POS_LINE_ITEM_XT_V','BUP_WHS_POS_LINE_ITEM','| LOG_INFO POS file WHS |');
         grip_etl.trunc_insert('FLH_WHS_POS_PAYMENT_XT_V','BUP_WHS_POS_PAYMENT','| LOG_INFO POS file WHS |');
         grip_etl.trunc_insert('FLH_WHS_POS_MARKETING_ATR_XT_V','BUP_WHS_POS_MARKETING_ATR','| LOG_INFO POS file WHS |');
         grip_etl.trunc_insert('FLH_WHS_PRH_INF_XT_V','BUP_WHS_PRODUCT_HIERARCHY','| LOG_INFO PRH file WHS |');
         grip_etl.trunc_insert('FLH_WHS_ART_INF_XT_V','BUP_WHS_ARTICLE','| LOG_INFO ART file WHS |');
         grip_etl.trunc_insert('FLH_WHS_ART_METADATA_V','FLH_WHS_METADATA', '| LOG_INFO ART Metadata');
         grip_etl.insert_append('FLH_WHS_POS_METADATA_V','FLH_WHS_METADATA', '| LOG_INFO POS Metadata');
         grip_etl.insert_append('FLH_WHS_PRH_METADATA_V','FLH_WHS_METADATA', '| LOG_INFO PRH Metadata');
         grip_etl.record_job  ('PF_RIS3_STAGING_WHS','PF_RIS3_CHECK_WHS','FLOW');
      --grip_etl.record_job  ('FILES_WHS','ccdw_ris.end_job(''RIS3WHS'')','SQLCALL');
      grip_etl.log_info ('END load WHS');
   grip_etl.cmd('RECORD_OFF PF_RIS3_STAGING_WHS');

   grip_etl.cmd('RECORD_ON PF_RIS3_STAGING_WOD');
      grip_etl.log_info ('START load WOD');
      --grip_etl.record_job  ('FILES_WOD','ccdw_ris.begin_job(''RIS3WOD'')','SQLCALL'); 
         grip_etl.trunc_insert('FLH_WOD_POS_FLIGHT_XT_V','BUP_WOD_POS_FLIGHT','| LOG_INFO POS file WOD |');
         grip_etl.trunc_insert('FLH_WOD_POS_LINE_ITEM_XT_V','BUP_WOD_POS_LINE_ITEM','| LOG_INFO POS file WOD |');
         grip_etl.trunc_insert('FLH_WOD_POS_PAYMENT_XT_V','BUP_WOD_POS_PAYMENT','| LOG_INFO POS file WOD |');
         grip_etl.trunc_insert('FLH_WOD_POS_MARKETING_ATR_XT_V','BUP_WOD_POS_MARKETING_ATR','| LOG_INFO POS file WOD |');
         grip_etl.trunc_insert('FLH_WOD_PRH_INF_XT_V','BUP_WOD_PRODUCT_HIERARCHY','| LOG_INFO PRH file WOD |');
         grip_etl.trunc_insert('FLH_WOD_ART_INF_XT_V','BUP_WOD_ARTICLE','| LOG_INFO ART file WOD |');
         grip_etl.trunc_insert('FLH_WOD_ART_METADATA_V','FLH_WOD_METADATA', '| LOG_INFO ART Metadata');
         grip_etl.insert_append('FLH_WOD_POS_METADATA_V','FLH_WOD_METADATA', '| LOG_INFO POS Metadata');
         grip_etl.insert_append('FLH_WOD_PRH_METADATA_V','FLH_WOD_METADATA', '| LOG_INFO PRH Metadata');
         grip_etl.record_job  ('PF_RIS3_STAGING_WOD','PF_RIS3_CHECK_WOD','FLOW');
      --grip_etl.record_job  ('FILES_WOD','ccdw_ris.end_job(''RIS3WOD'')','SQLCALL');
      grip_etl.log_info ('END load WOD');
   grip_etl.cmd('RECORD_OFF PF_RIS3_STAGING_WOD');



/*----------------------------------------------------------------------------------------------------------------------*
 *   MAIN Flow STG
 *----------------------------------------------------------------------------------------------------------------------*/

   grip_etl.cmd('RECORD_ON PF_RIS3_STAGING_MAIN');
      grip_etl.log_info ('START load');
      grip_etl.record_job  ('PF_RIS3_STAGING_MAIN','PF_RIS3_STAGING_AVI','FLOW');
      grip_etl.record_job  ('PF_RIS3_STAGING_MAIN','PF_RIS3_STAGING_AKO','FLOW');
      grip_etl.record_job  ('PF_RIS3_STAGING_MAIN','PF_RIS3_STAGING_CAP','FLOW');
      grip_etl.record_job  ('PF_RIS3_STAGING_MAIN','PF_RIS3_STAGING_GAS','FLOW');
      grip_etl.record_job  ('PF_RIS3_STAGING_MAIN','PF_RIS3_STAGING_GER','FLOW');
      grip_etl.record_job  ('PF_RIS3_STAGING_MAIN','PF_RIS3_STAGING_KAP','FLOW');
      grip_etl.record_job  ('PF_RIS3_STAGING_MAIN','PF_RIS3_STAGING_SAR','FLOW');
      grip_etl.record_job  ('PF_RIS3_STAGING_MAIN','PF_RIS3_STAGING_WHS','FLOW');
      grip_etl.record_job  ('PF_RIS3_STAGING_MAIN','PF_RIS3_STAGING_WOD','FLOW');
   grip_etl.cmd('RECORD_OFF PF_RIS3_STAGING_MAIN');

/*----------------------------------------------------------------------------------------------------------------------*
 *   Check Flow RIS
 *----------------------------------------------------------------------------------------------------------------------*/

   grip_etl.cmd('RECORD_ON PF_CHECK_RIS_COMPLETE');
      grip_etl.record_job  ('PF_CHECK_RIS_COMPLETE','PF_RIS3_CHECK_AKO','FLOW');   --Check the load the Staging Area
      grip_etl.record_job  ('PF_CHECK_RIS_COMPLETE','PF_RIS3_CHECK_AVI','FLOW');   --Check the load the Staging Area
      grip_etl.record_job  ('PF_CHECK_RIS_COMPLETE','PF_RIS3_CHECK_CAP','FLOW');   --Check the load the Staging Area
      grip_etl.record_job  ('PF_CHECK_RIS_COMPLETE','PF_RIS3_CHECK_GAS','FLOW');   --Check the load the Staging Area
      grip_etl.record_job  ('PF_CHECK_RIS_COMPLETE','PF_RIS3_CHECK_GER','FLOW');   --Check the load the Staging Area
      grip_etl.record_job  ('PF_CHECK_RIS_COMPLETE','PF_RIS3_CHECK_KAP','FLOW');   --Check the load the Staging Area
      grip_etl.record_job  ('PF_CHECK_RIS_COMPLETE','PF_RIS3_CHECK_SAR','FLOW');   --Check the load the Staging Area
      grip_etl.record_job  ('PF_CHECK_RIS_COMPLETE','PF_RIS3_CHECK_WHS','FLOW');   --Check the load the Staging Area
      grip_etl.record_job  ('PF_CHECK_RIS_COMPLETE','PF_RIS3_CHECK_WOD','FLOW');   --Check the load the Staging Area
   grip_etl.cmd('RECORD_OFF PF_CHECK_RIS_COMPLETE');


   /*----------------------------------------------------------------------------------------------------------------------*
 *   MAIN Flow RIS
 *----------------------------------------------------------------------------------------------------------------------*/

   grip_etl.cmd('RECORD_ON PF_LOAD_RIS_COMPLETE');
      grip_etl.record_job  ('PF_LOAD_RIS_COMPLETE','PF_RIS3_STAGING_MAIN','FLOW');   --Load the Staging Area
      grip_etl.record_job  ('PF_LOAD_RIS_COMPLETE','PF_CHECK_RIS_COMPLETE','FLOW');   --Load the Staging Area
   grip_etl.cmd('RECORD_OFF PF_LOAD_RIS_COMPLETE');



END;
/
