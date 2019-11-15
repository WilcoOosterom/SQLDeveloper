---------------------------
--New PROCEDURE
--INSTALL_RIS3_FILE_JOBS
---------------------------
CREATE OR REPLACE PROCEDURE "RPT_VIEW_USER_RIS"."INSTALL_RIS3_FILE_JOBS" 
AS                                                                                                                        
  l_source varchar2(30) := $$PLSQL_UNIT;
BEGIN   

/*----------------------------------------------------------------------------------------------------------------------* 
 * INSTALL_RIS3_FILE_JOBS                                                                                                      
 * Schema RIS_STG                                                                                                             
 * Version: 1.00.40                                                                                                       
 * Date 12-June-2019                                                                                                     
 * Developer: Wilco  Oosterom
 *                                                                                                                        
 * Goal: Laden van de PRH, POS en ART files in de tabellen                                                                
 *                                                                                                                        
 *----------------------------------------------------------------------------------------------------------------------*/
    grip_etl.cmd('INSTALLER '  || l_source );  

  ------AKO------
   grip_etl.cmd('RECORD_ON RIS3_TRUNC_AKO'); 
      grip_etl.exec('execute immediate ''truncate table FLH_AKO_POS_REC drop storage'' ');
      grip_etl.exec('execute immediate ''truncate table FLH_AKO_PRH_REC drop storage'' ');
      grip_etl.exec('execute immediate ''truncate table FLH_AKO_ART_REC drop storage'' ');
   grip_etl.cmd('RECORD_OFF RIS3_TRUNC_AKO');                                                                                   

   grip_etl.cmd('RECORD_ON RIS3_FILES_AKO');                                                                                   
      grip_etl.log_info ('START load RIS3 AKO');                                                                               
      --grip_etl.record_job  ('RIS3_FILES_AKO','ccdw_ris.begin_job(''RIS3AKO'')','SQLCALL');                                         
         grip_etl.insert_append_ss_2('FLH_AKO_POS_XT_V','FLH_AKO_POS_REC','| LOG_INFO POS file AKO |');                            
         grip_etl.insert_append_ss_2('FLH_AKO_PRH_XT_V','FLH_AKO_PRH_REC','| LOG_INFO PRH file AKO |');                            
         grip_etl.insert_append_ss_2('FLH_AKO_ART_XT_V','FLH_AKO_ART_REC','| LOG_INFO ART file AKO |');                            
      --grip_etl.record_job  ('RIS3_FILES_AKO','ccdw_ris.end_job(''RIS3AKO'')','SQLCALL');                                           
      grip_etl.log_info ('END load RIS3 AKO');                                                                                   
   grip_etl.cmd('RECORD_OFF RIS3_FILES_AKO');                                                                                  

   grip_etl.cmd('RECORD_ON PF_RIS3_FILES_AKO'); 
      grip_etl.record_job  ('PF_RIS3_FILES_AKO','RIS3_TRUNC_AKO','FLOW');
      grip_etl.record_job  ('PF_RIS3_FILES_AKO','RIS3_FILES_AKO','FLOW');
   grip_etl.cmd('RECORD_OFF PF_RIS3_FILES_AKO');                                                                                   

 ------AVI------
   grip_etl.cmd('RECORD_ON RIS3_TRUNC_AVI'); 
      grip_etl.exec('execute immediate ''truncate table FLH_AVI_POS_REC drop storage'' ');
      grip_etl.exec('execute immediate ''truncate table FLH_AVI_PRH_REC drop storage'' ');
      grip_etl.exec('execute immediate ''truncate table FLH_AVI_ART_REC drop storage'' ');
   grip_etl.cmd('RECORD_OFF RIS3_TRUNC_AVI');                                                                                   

   grip_etl.cmd('RECORD_ON RIS3_FILES_AVI');                                                                                   
      grip_etl.log_info ('START load RIS3 AVI');                                                                               
      --grip_etl.record_job  ('RIS3_FILES_AVI','ccdw_ris.begin_job(''RIS3AVI'')','SQLCALL');                                         
         grip_etl.insert_append_ss_2('FLH_AVI_POS_XT_V','FLH_AVI_POS_REC','| LOG_INFO POS file AVI |');                            
         grip_etl.insert_append_ss_2('FLH_AVI_PRH_XT_V','FLH_AVI_PRH_REC','| LOG_INFO PRH file AVI |');                            
         grip_etl.insert_append_ss_2('FLH_AVI_ART_XT_V','FLH_AVI_ART_REC','| LOG_INFO ART file AVI |');                            
      --grip_etl.record_job  ('RIS3_FILES_AVI','ccdw_ris.end_job(''RIS3AVI'')','SQLCALL');                                           
      grip_etl.log_info ('END load RIS3 AVI');                                                                                   
   grip_etl.cmd('RECORD_OFF RIS3_FILES_AVI');                                                                                  

   grip_etl.cmd('RECORD_ON PF_RIS3_FILES_AVI'); 
      grip_etl.record_job  ('PF_RIS3_FILES_AVI','RIS3_TRUNC_AVI','FLOW');
      grip_etl.record_job  ('PF_RIS3_FILES_AVI','RIS3_FILES_AVI','FLOW');
   grip_etl.cmd('RECORD_OFF PF_RIS3_FILES_AVI');                                                                                   

------CAP------
   grip_etl.cmd('RECORD_ON RIS3_TRUNC_CAP'); 
      grip_etl.exec('execute immediate ''truncate table FLH_CAP_POS_REC drop storage'' ');
      grip_etl.exec('execute immediate ''truncate table FLH_CAP_PRH_REC drop storage'' ');
      grip_etl.exec('execute immediate ''truncate table FLH_CAP_ART_REC drop storage'' ');
   grip_etl.cmd('RECORD_OFF RIS3_TRUNC_CAP');                                                                                   

   grip_etl.cmd('RECORD_ON RIS3_FILES_CAP');                                                                                   
      grip_etl.log_info ('START load RIS3 CAP');                                                                               
      --grip_etl.record_job  ('RIS3_FILES_CAP','ccdw_ris.begin_job(''RIS3CAP'')','SQLCALL');                                         
         grip_etl.insert_append_ss_2('FLH_CAP_POS_XT_V','FLH_CAP_POS_REC','| LOG_INFO POS file CAP |');                            
         grip_etl.insert_append_ss_2('FLH_CAP_PRH_XT_V','FLH_CAP_PRH_REC','| LOG_INFO PRH file CAP |');                            
         grip_etl.insert_append_ss_2('FLH_CAP_ART_XT_V','FLH_CAP_ART_REC','| LOG_INFO ART file CAP |');                            
      --grip_etl.record_job  ('RIS3_FILES_CAP','ccdw_ris.end_job(''RIS3CAP'')','SQLCALL');                                           
      grip_etl.log_info ('END load RIS3 CAP');                                                                                   
   grip_etl.cmd('RECORD_OFF RIS3_FILES_CAP');                                                                                  

   grip_etl.cmd('RECORD_ON PF_RIS3_FILES_CAP'); 
      grip_etl.record_job  ('PF_RIS3_FILES_CAP','RIS3_TRUNC_CAP','FLOW');
      grip_etl.record_job  ('PF_RIS3_FILES_CAP','RIS3_FILES_CAP','FLOW');
   grip_etl.cmd('RECORD_OFF PF_RIS3_FILES_CAP');                                                                                   

  ------GAS------
   grip_etl.cmd('RECORD_ON RIS3_TRUNC_GAS'); 
      grip_etl.exec('execute immediate ''truncate table FLH_GAS_POS_REC drop storage'' ');
      grip_etl.exec('execute immediate ''truncate table FLH_GAS_PRH_REC drop storage'' ');
      grip_etl.exec('execute immediate ''truncate table FLH_GAS_ART_REC drop storage'' ');
   grip_etl.cmd('RECORD_OFF RIS3_TRUNC_GAS');                                                                                   

   grip_etl.cmd('RECORD_ON RIS3_FILES_GAS');                                                                                   
      grip_etl.log_info ('START load RIS3 GAS');                                                                               
      --grip_etl.record_job  ('RIS3_FILES_GAS','ccdw_ris.begin_job(''RIS3GAS'')','SQLCALL');                                         
         grip_etl.insert_append_ss_2('FLH_GAS_POS_XT_V','FLH_GAS_POS_REC','| LOG_INFO POS file GAS |');                            
         grip_etl.insert_append_ss_2('FLH_GAS_PRH_XT_V','FLH_GAS_PRH_REC','| LOG_INFO PRH file GAS |');                            
         grip_etl.insert_append_ss_2('FLH_GAS_ART_XT_V','FLH_GAS_ART_REC','| LOG_INFO ART file GAS |');                            
      --grip_etl.record_job  ('RIS3_FILES_GAS','ccdw_ris.end_job(''RIS3GAS'')','SQLCALL');                                           
      grip_etl.log_info ('END load RIS3 GAS');                                                                                   
   grip_etl.cmd('RECORD_OFF RIS3_FILES_GAS');                                                                                  

   grip_etl.cmd('RECORD_ON PF_RIS3_FILES_GAS'); 
      grip_etl.record_job  ('PF_RIS3_FILES_GAS','RIS3_TRUNC_GAS','FLOW');
      grip_etl.record_job  ('PF_RIS3_FILES_GAS','RIS3_FILES_GAS','FLOW');
   grip_etl.cmd('RECORD_OFF PF_RIS3_FILES_GAS');                                                                                   

  ------GER------
   grip_etl.cmd('RECORD_ON RIS3_TRUNC_GER'); 
      grip_etl.exec('execute immediate ''truncate table FLH_GER_POS_REC drop storage'' ');
      grip_etl.exec('execute immediate ''truncate table FLH_GER_PRH_REC drop storage'' ');
      grip_etl.exec('execute immediate ''truncate table FLH_GER_ART_REC drop storage'' ');
   grip_etl.cmd('RECORD_OFF RIS3_TRUNC_GER');                                                                                   

   grip_etl.cmd('RECORD_ON RIS3_FILES_GER');                                                                                   
      grip_etl.log_info ('START load RIS3 GER');                                                                               
      --grip_etl.record_job  ('RIS3_FILES_GER','ccdw_ris.begin_job(''RIS3GER'')','SQLCALL');                                         
         grip_etl.insert_append_ss_2('FLH_GER_POS_XT_V','FLH_GER_POS_REC','| LOG_INFO POS file GER |');                            
         grip_etl.insert_append_ss_2('FLH_GER_PRH_XT_V','FLH_GER_PRH_REC','| LOG_INFO PRH file GER |');                            
         grip_etl.insert_append_ss_2('FLH_GER_ART_XT_V','FLH_GER_ART_REC','| LOG_INFO ART file GER |');                            
      --grip_etl.record_job  ('RIS3_FILES_GER','ccdw_ris.end_job(''RIS3GER'')','SQLCALL');                                           
      grip_etl.log_info ('END load RIS3 GER');                                                                                   
   grip_etl.cmd('RECORD_OFF RIS3_FILES_GER');                                                                                  

   grip_etl.cmd('RECORD_ON PF_RIS3_FILES_GER'); 
      grip_etl.record_job  ('PF_RIS3_FILES_GER','RIS3_TRUNC_GER','FLOW');
      grip_etl.record_job  ('PF_RIS3_FILES_GER','RIS3_FILES_GER','FLOW');
   grip_etl.cmd('RECORD_OFF PF_RIS3_FILES_GER');                                                                                   

------KAP------
    grip_etl.cmd('RECORD_ON RIS3_TRUNC_KAP'); 
      grip_etl.exec('execute immediate ''truncate table FLH_KAP_POS_REC drop storage'' ');
      grip_etl.exec('execute immediate ''truncate table FLH_KAP_PRH_REC drop storage'' ');
      grip_etl.exec('execute immediate ''truncate table FLH_KAP_ART_REC drop storage'' ');
   grip_etl.cmd('RECORD_OFF RIS3_TRUNC_KAP');                                                                                   

   grip_etl.cmd('RECORD_ON RIS3_FILES_KAP');                                                                                   
      grip_etl.log_info ('START load RIS3 KAP');                                                                               
      --grip_etl.record_job  ('RIS3_FILES_KAP','ccdw_ris.begin_job(''RIS3KAP'')','SQLCALL');                                         
         grip_etl.insert_append_ss_2('FLH_KAP_POS_XT_V','FLH_KAP_POS_REC','| LOG_INFO POS file KAP |');                            
         grip_etl.insert_append_ss_2('FLH_KAP_PRH_XT_V','FLH_KAP_PRH_REC','| LOG_INFO PRH file KAP |');                            
         grip_etl.insert_append_ss_2('FLH_KAP_ART_XT_V','FLH_KAP_ART_REC','| LOG_INFO ART file KAP |');                            
      --grip_etl.record_job  ('RIS3_FILES_KAP','ccdw_ris.end_job(''RIS3KAP'')','SQLCALL');                                           
      grip_etl.log_info ('END load RIS3 KAP');                                                                                   
   grip_etl.cmd('RECORD_OFF RIS3_FILES_KAP');                                                                                  

   grip_etl.cmd('RECORD_ON PF_RIS3_FILES_KAP'); 
      grip_etl.record_job  ('PF_RIS3_FILES_KAP','RIS3_TRUNC_KAP','FLOW');
      grip_etl.record_job  ('PF_RIS3_FILES_KAP','RIS3_FILES_KAP','FLOW');
   grip_etl.cmd('RECORD_OFF PF_RIS3_KAP');                                                                                   

------SAR------
   grip_etl.cmd('RECORD_ON RIS3_TRUNC_SAR'); 
      grip_etl.exec('execute immediate ''truncate table FLH_SAR_POS_REC drop storage'' ');
      grip_etl.exec('execute immediate ''truncate table FLH_SAR_PRH_REC drop storage'' ');
      grip_etl.exec('execute immediate ''truncate table FLH_SAR_ART_REC drop storage'' ');
   grip_etl.cmd('RECORD_OFF RIS3_TRUNC_SAR');                                                                                   

   grip_etl.cmd('RECORD_ON RIS3_FILES_SAR');                                                                                   
      grip_etl.log_info ('START load RIS3 SAR');                                                                               
      --grip_etl.record_job  ('RIS3_FILES_SAR','ccdw_ris.begin_job(''RIS3SAR'')','SQLCALL');                                         
         grip_etl.insert_append_ss_2('FLH_SAR_POS_XT_V','FLH_SAR_POS_REC','| LOG_INFO POS file SAR |');                            
         grip_etl.insert_append_ss_2('FLH_SAR_PRH_XT_V','FLH_SAR_PRH_REC','| LOG_INFO PRH file SAR |');                            
         grip_etl.insert_append_ss_2('FLH_SAR_ART_XT_V','FLH_SAR_ART_REC','| LOG_INFO ART file SAR |');                            
      --grip_etl.record_job  ('RIS3_FILES_SAR','ccdw_ris.end_job(''RIS3SAR'')','SQLCALL');                                           
      grip_etl.log_info ('END load RIS3 SAR');                                                                                   
   grip_etl.cmd('RECORD_OFF RIS3_FILES_SAR');                                                                                  

   grip_etl.cmd('RECORD_ON PF_RIS3_FILES_SAR'); 
      grip_etl.record_job  ('PF_RIS3_FILES_SAR','RIS3_TRUNC_SAR','FLOW');
      grip_etl.record_job  ('PF_RIS3_FILES_SAR','RIS3_FILES_SAR','FLOW');
   grip_etl.cmd('RECORD_OFF PF_RIS3_FILES_SAR');                                                                                   

  ------WHS------
   grip_etl.cmd('RECORD_ON RIS3_TRUNC_WHS'); 
      grip_etl.exec('execute immediate ''truncate table FLH_WHS_POS_REC drop storage'' ');
      grip_etl.exec('execute immediate ''truncate table FLH_WHS_PRH_REC drop storage'' ');
      grip_etl.exec('execute immediate ''truncate table FLH_WHS_ART_REC drop storage'' ');
   grip_etl.cmd('RECORD_OFF RIS3_TRUNC_WHS');                                                                                   

   grip_etl.cmd('RECORD_ON RIS3_FILES_WHS');                                                                                   
      grip_etl.log_info ('START load RIS3 WHS');                                                                               
      --grip_etl.record_job  ('RIS3_FILES_WHS','ccdw_ris.begin_job(''RIS3WHS'')','SQLCALL');                                         
         grip_etl.insert_append_ss_2('FLH_WHS_POS_XT_V','FLH_WHS_POS_REC','| LOG_INFO POS file WHS |');                            
         grip_etl.insert_append_ss_2('FLH_WHS_PRH_XT_V','FLH_WHS_PRH_REC','| LOG_INFO PRH file WHS |');                            
         grip_etl.insert_append_ss_2('FLH_WHS_ART_XT_V','FLH_WHS_ART_REC','| LOG_INFO ART file WHS |');                            
      --grip_etl.record_job  ('RIS3_FILES_WHS','ccdw_ris.end_job(''RIS3WHS'')','SQLCALL');                                           
      grip_etl.log_info ('END load RIS3 WHS');                                                                                   
   grip_etl.cmd('RECORD_OFF RIS3_FILES_WHS');                                                                                  

   grip_etl.cmd('RECORD_ON PF_RIS3_FILES_WHS'); 
      grip_etl.record_job  ('PF_RIS3_FILES_WHS','RIS3_TRUNC_WHS','FLOW');
      grip_etl.record_job  ('PF_RIS3_FILES_WHS','RIS3_FILES_WHS','FLOW');
   grip_etl.cmd('RECORD_OFF PF_RIS3_FILES_WHS');                                                                                   

 ------WOD------
   grip_etl.cmd('RECORD_ON RIS3_TRUNC_WOD'); 
      grip_etl.exec('execute immediate ''truncate table FLH_WOD_POS_REC drop storage'' ');
      grip_etl.exec('execute immediate ''truncate table FLH_WOD_PRH_REC drop storage'' ');
      grip_etl.exec('execute immediate ''truncate table FLH_WOD_ART_REC drop storage'' ');
   grip_etl.cmd('RECORD_OFF RIS3_TRUNC_WOD');                                                                                   

   grip_etl.cmd('RECORD_ON RIS3_FILES_WOD');                                                                                   
      grip_etl.log_info ('START load RIS3 WOD');                                                                               
      --grip_etl.record_job  ('RIS3_FILES_WOD','ccdw_ris.begin_job(''RIS3WOD'')','SQLCALL');                                         
         grip_etl.insert_append_ss_2('FLH_WOD_POS_XT_V','FLH_WOD_POS_REC','| LOG_INFO POS file WOD |');                            
         grip_etl.insert_append_ss_2('FLH_WOD_PRH_XT_V','FLH_WOD_PRH_REC','| LOG_INFO PRH file WOD |');                            
         grip_etl.insert_append_ss_2('FLH_WOD_ART_XT_V','FLH_WOD_ART_REC','| LOG_INFO ART file WOD |');                            
      --grip_etl.record_job  ('RIS3_FILES_WOD','ccdw_ris.end_job(''RIS3WOD'')','SQLCALL');                                           
      grip_etl.log_info ('END load RIS3 WOD');                                                                                   
   grip_etl.cmd('RECORD_OFF RIS3_FILES_WOD');                                                                                  

   grip_etl.cmd('RECORD_ON PF_RIS3_FILES_WOD'); 
      grip_etl.record_job  ('PF_RIS3_FILES_WOD','RIS3_TRUNC_WOD','FLOW');
      grip_etl.record_job  ('PF_RIS3_FILES_WOD','RIS3_FILES_WOD','FLOW');
   grip_etl.cmd('RECORD_OFF PF_RIS3_FILES_WOD');                                                                                   






/*----------------------------------------------------------------------------------------------------------------------* 
 *   MAIN Flow                                                                                                            
 *----------------------------------------------------------------------------------------------------------------------*/

   grip_etl.cmd('RECORD_ON PF_RIS3_FILES_MAIN');                                                                                
      grip_etl.log_info ('START load');                                                                                   
      grip_etl.record_job  ('PF_RIS3_MAIN','PF_RIS3_FILES_AKO','FLOW');
      grip_etl.record_job  ('PF_RIS3_MAIN','PF_RIS3_FILES_AVI','FLOW');
      grip_etl.record_job  ('PF_RIS3_MAIN','PF_RIS3_FILES_CAP','FLOW');
      grip_etl.record_job  ('PF_RIS3_MAIN','PF_RIS3_FILES_GAS','FLOW');
      grip_etl.record_job  ('PF_RIS3_MAIN','PF_RIS3_FILES_GER','FLOW');
      grip_etl.record_job  ('PF_RIS3_MAIN','PF_RIS3_FILES_KAP','FLOW');
      grip_etl.record_job  ('PF_RIS3_MAIN','PF_RIS3_FILES_SAR','FLOW');
      grip_etl.record_job  ('PF_RIS3_MAIN','PF_RIS3_FILES_WHS','FLOW');
      grip_etl.record_job  ('PF_RIS3_MAIN','PF_RIS3_FILES_WOD','FLOW');
   grip_etl.cmd('RECORD_OFF PF_RIS3_FILES_MAIN');  


/*----------------------------------------------------------------------------------------------------------------------* 
 *   ACTIVATE Looping for file loading (FLH activation)                                                                                                            
 *----------------------------------------------------------------------------------------------------------------------*/

   grip_tapi.exec('update grip_job set flh_source = ''RIS3AKO'' where parent = ''RIS3_FILES_AKO'' and username = ''RIS_STG'' ');
   grip_tapi.exec('update grip_job set flh_source = ''RIS3AVI'' where parent = ''RIS3_FILES_AVI'' and username = ''RIS_STG'' ');
   grip_tapi.exec('update grip_job set flh_source = ''RIS3CAP'' where parent = ''RIS3_FILES_CAP'' and username = ''RIS_STG'' ');
   grip_tapi.exec('update grip_job set flh_source = ''RIS3GAS'' where parent = ''RIS3_FILES_GAS'' and username = ''RIS_STG'' ');
   grip_tapi.exec('update grip_job set flh_source = ''RIS3GER'' where parent = ''RIS3_FILES_GER'' and username = ''RIS_STG'' ');
   grip_tapi.exec('update grip_job set flh_source = ''RIS3KAP'' where parent = ''RIS3_FILES_KAP'' and username = ''RIS_STG'' ');
   grip_tapi.exec('update grip_job set flh_source = ''RIS3SAR'' where parent = ''RIS3_FILES_SAR'' and username = ''RIS_STG'' ');
   grip_tapi.exec('update grip_job set flh_source = ''RIS3WHS'' where parent = ''RIS3_FILES_WHS'' and username = ''RIS_STG'' ');
   grip_tapi.exec('update grip_job set flh_source = ''RIS3WOD'' where parent = ''RIS3_FILES_WOD'' and username = ''RIS_STG'' ');

END;
/
