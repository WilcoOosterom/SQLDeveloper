---------------------------
--New PROCEDURE
--INSTALL_RIS_RIS3_CONVERSION
---------------------------
CREATE OR REPLACE PROCEDURE "RPT_VIEW_USER_RIS"."INSTALL_RIS_RIS3_CONVERSION" AS
     l_source varchar2(30) := $$PLSQL_UNIT;
BEGIN
/*------------------------------------------------------------------
*  INSTALL_RIS_RIS3_CONVERSION
*  Generated on: 08-11-2019
*  Version     : 2019-47
*  Developer   : Wilco Oosterom
*  
*  Purpose     : Generating GRIP package to migrate data up until 2016 from RIS
* 
*/------------------------------------------------------------------
   grip_etl.cmd('INSTALLER '  || l_source );


   grip_etl.cmd('RECORD_ON PF_CONVERSION_ARA');
      grip_etl.log_info ('START Conversion ARA');
         grip_etl.trunc_insert('CV_RIS_ARA_ARTICLE_V','BUP_ARA_ARTICLE','| LOG_INFO Conversion Article info ARA |');
         grip_etl.trunc_insert('CV_RIS_ARA_PRODUCT_HIERACHY_V','BUP_ARA_PRODUCT_HIERARCHY','| LOG_INFO Conversion Product Hierarchy ARA |');
         grip_etl.trunc_insert('CV_RIS_ARA_POS_PAYMENT_V','BUP_ARA_POS_PAYMENT','| LOG_INFO Conversion payment info ARA |');
         grip_etl.trunc_insert('CV_RIS_ARA_POS_MARKETING_ATR_V','BUP_ARA_POS_MARKETING_ATR','| LOG_INFO Conversion Marketing info ARA |');
         grip_etl.trunc_insert('CV_RIS_ARA_POS_LINE_ITEM_V','BUP_ARA_POS_LINE_ITEM','| LOG_INFO Conversion sales info ARA |');
         grip_etl.trunc_insert('CV_RIS_ARA_POS_FLIGHT_V','BUP_ARA_POS_FLIGHT','| LOG_INFO Conversion flight info ARA |');
      grip_etl.log_info ('END Conversion ARA');
   grip_etl.cmd('RECORD_OFF PF_CONVERSION_ARA');


   grip_etl.cmd('RECORD_ON PF_CONVERSION_AVI');
      grip_etl.log_info ('START Conversion AVI');
         grip_etl.trunc_insert('CV_RIS_AVI_ARTICLE_V','BUP_AVI_ARTICLE','| LOG_INFO Conversion Article info AVI |');
         grip_etl.trunc_insert('CV_RIS_AVI_PRODUCT_HIERACHY_V','BUP_AVI_PRODUCT_HIERARCHY','| LOG_INFO Conversion Product Hierarchy AVI |');
         grip_etl.trunc_insert('CV_RIS_AVI_POS_PAYMENT_V','BUP_AVI_POS_PAYMENT','| LOG_INFO Conversion payment info AVI |');
         grip_etl.trunc_insert('CV_RIS_AVI_POS_MARKETING_ATR_V','BUP_AVI_POS_MARKETING_ATR','| LOG_INFO Conversion Marketing info AVI |');
         grip_etl.trunc_insert('CV_RIS_AVI_POS_LINE_ITEM_V','BUP_AVI_POS_LINE_ITEM','| LOG_INFO Conversion sales info AVI |');
         grip_etl.trunc_insert('CV_RIS_AVI_POS_FLIGHT_V','BUP_AVI_POS_FLIGHT','| LOG_INFO Conversion flight info AVI |');
      grip_etl.log_info ('END Conversion AVI');
   grip_etl.cmd('RECORD_OFF PF_CONVERSION_AVI');


   grip_etl.cmd('RECORD_ON PF_CONVERSION_CAP');
      grip_etl.log_info ('START Conversion CAP');
         grip_etl.trunc_insert('CV_RIS_CAP_ARTICLE_V','BUP_CAP_ARTICLE','| LOG_INFO Conversion Article info CAP |');
         grip_etl.trunc_insert('CV_RIS_CAP_PRODUCT_HIERACHY_V','BUP_CAP_PRODUCT_HIERARCHY','| LOG_INFO Conversion Product Hierarchy CAP |');
         grip_etl.trunc_insert('CV_RIS_CAP_POS_PAYMENT_V','BUP_CAP_POS_PAYMENT','| LOG_INFO Conversion payment info CAP |');
         grip_etl.trunc_insert('CV_RIS_CAP_POS_MARKETING_ATR_V','BUP_CAP_POS_MARKETING_ATR','| LOG_INFO Conversion Marketing info CAP |');
         grip_etl.trunc_insert('CV_RIS_CAP_POS_LINE_ITEM_V','BUP_CAP_POS_LINE_ITEM','| LOG_INFO Conversion sales info CAP |');
         grip_etl.trunc_insert('CV_RIS_CAP_POS_FLIGHT_V','BUP_CAP_POS_FLIGHT','| LOG_INFO Conversion flight info CAP |');
      grip_etl.log_info ('END Conversion CAP');
   grip_etl.cmd('RECORD_OFF PF_CONVERSION_CAP');


   grip_etl.cmd('RECORD_ON PF_CONVERSION_GAS');
      grip_etl.log_info ('START Conversion GAS');
         grip_etl.trunc_insert('CV_RIS_GAS_ARTICLE_V','BUP_GAS_ARTICLE','| LOG_INFO Conversion Article info GAS |');
         grip_etl.trunc_insert('CV_RIS_GAS_PRODUCT_HIERACHY_V','BUP_GAS_PRODUCT_HIERARCHY','| LOG_INFO Conversion Product Hierarchy GAS |');
         grip_etl.trunc_insert('CV_RIS_GAS_POS_PAYMENT_V','BUP_GAS_POS_PAYMENT','| LOG_INFO Conversion payment info GAS |');
         grip_etl.trunc_insert('CV_RIS_GAS_POS_MARKETING_ATR_V','BUP_GAS_POS_MARKETING_ATR','| LOG_INFO Conversion Marketing info GAS |');
         grip_etl.trunc_insert('CV_RIS_GAS_POS_LINE_ITEM_V','BUP_GAS_POS_LINE_ITEM','| LOG_INFO Conversion sales info GAS |');
         grip_etl.trunc_insert('CV_RIS_GAS_POS_FLIGHT_V','BUP_GAS_POS_FLIGHT','| LOG_INFO Conversion flight info GAS |');
      grip_etl.log_info ('END Conversion GAS');
   grip_etl.cmd('RECORD_OFF PF_CONVERSION_GAS');


   grip_etl.cmd('RECORD_ON PF_CONVERSION_WOD');
      grip_etl.log_info ('START Conversion WOD');
         grip_etl.trunc_insert('CV_RIS_WOD_ARTICLE_V','BUP_WOD_ARTICLE','| LOG_INFO Conversion Article info WOD |');
         grip_etl.trunc_insert('CV_RIS_WOD_PRODUCT_HIERACHY_V','BUP_WOD_PRODUCT_HIERARCHY','| LOG_INFO Conversion Product Hierarchy WOD |');
         grip_etl.trunc_insert('CV_RIS_WOD_POS_PAYMENT_V','BUP_WOD_POS_PAYMENT','| LOG_INFO Conversion payment info WOD |');
         grip_etl.trunc_insert('CV_RIS_WOD_POS_MARKETING_ATR_V','BUP_WOD_POS_MARKETING_ATR','| LOG_INFO Conversion Marketing info WOD |');
         grip_etl.trunc_insert('CV_RIS_WOD_POS_LINE_ITEM_V','BUP_WOD_POS_LINE_ITEM','| LOG_INFO Conversion sales info WOD |');
         grip_etl.trunc_insert('CV_RIS_WOD_POS_FLIGHT_V','BUP_WOD_POS_FLIGHT','| LOG_INFO Conversion flight info WOD |');
      grip_etl.log_info ('END Conversion WOD');
   grip_etl.cmd('RECORD_OFF PF_CONVERSION_WOD');


   grip_etl.cmd('RECORD_ON PF_CONVERSION_KAP');
      grip_etl.log_info ('START Conversion KAP');
         grip_etl.trunc_insert('CV_RIS_KAP_ARTICLE_V','BUP_KAP_ARTICLE','| LOG_INFO Conversion Article info KAP |');
         grip_etl.trunc_insert('CV_RIS_KAP_PRODUCT_HIERACHY_V','BUP_KAP_PRODUCT_HIERARCHY','| LOG_INFO Conversion Product Hierarchy KAP |');
         grip_etl.trunc_insert('CV_RIS_KAP_POS_PAYMENT_V','BUP_KAP_POS_PAYMENT','| LOG_INFO Conversion payment info KAP |');
         grip_etl.trunc_insert('CV_RIS_KAP_POS_MARKETING_ATR_V','BUP_KAP_POS_MARKETING_ATR','| LOG_INFO Conversion Marketing info KAP |');
         grip_etl.trunc_insert('CV_RIS_KAP_POS_LINE_ITEM_V','BUP_KAP_POS_LINE_ITEM','| LOG_INFO Conversion sales info KAP |');
         grip_etl.trunc_insert('CV_RIS_KAP_POS_FLIGHT_V','BUP_KAP_POS_FLIGHT','| LOG_INFO Conversion flight info KAP |');
      grip_etl.log_info ('END Conversion KAP');
   grip_etl.cmd('RECORD_OFF PF_CONVERSION_KAP');


   grip_etl.cmd('RECORD_ON PF_CONVERSION_LAG');
      grip_etl.log_info ('START Conversion LAG');
         grip_etl.trunc_insert('CV_RIS_LAG_ARTICLE_V','BUP_LAG_ARTICLE','| LOG_INFO Conversion Article info LAG |');
         grip_etl.trunc_insert('CV_RIS_LAG_PRODUCT_HIERACHY_V','BUP_LAG_PRODUCT_HIERARCHY','| LOG_INFO Conversion Product Hierarchy LAG |');
         grip_etl.trunc_insert('CV_RIS_LAG_POS_PAYMENT_V','BUP_LAG_POS_PAYMENT','| LOG_INFO Conversion payment info LAG |');
         grip_etl.trunc_insert('CV_RIS_LAG_POS_MARKETING_ATR_V','BUP_LAG_POS_MARKETING_ATR','| LOG_INFO Conversion Marketing info LAG |');
         grip_etl.trunc_insert('CV_RIS_LAG_POS_LINE_ITEM_V','BUP_LAG_POS_LINE_ITEM','| LOG_INFO Conversion sales info LAG |');
         grip_etl.trunc_insert('CV_RIS_LAG_POS_FLIGHT_V','BUP_LAG_POS_FLIGHT','| LOG_INFO Conversion flight info LAG |');
      grip_etl.log_info ('END Conversion LAG');
   grip_etl.cmd('RECORD_OFF PF_CONVERSION_LAG');


   grip_etl.cmd('RECORD_ON PF_CONVERSION_MIM');
      grip_etl.log_info ('START Conversion MIM');
         grip_etl.trunc_insert('CV_RIS_MIM_ARTICLE_V','BUP_MIM_ARTICLE','| LOG_INFO Conversion Article info MIM |');
         grip_etl.trunc_insert('CV_RIS_MIM_PRODUCT_HIERACHY_V','BUP_MIM_PRODUCT_HIERARCHY','| LOG_INFO Conversion Product Hierarchy MIM |');
         grip_etl.trunc_insert('CV_RIS_MIM_POS_PAYMENT_V','BUP_MIM_POS_PAYMENT','| LOG_INFO Conversion payment info MIM |');
         grip_etl.trunc_insert('CV_RIS_MIM_POS_MARKETING_ATR_V','BUP_MIM_POS_MARKETING_ATR','| LOG_INFO Conversion Marketing info MIM |');
         grip_etl.trunc_insert('CV_RIS_MIM_POS_LINE_ITEM_V','BUP_MIM_POS_LINE_ITEM','| LOG_INFO Conversion sales info MIM |');
         grip_etl.trunc_insert('CV_RIS_MIM_POS_FLIGHT_V','BUP_MIM_POS_FLIGHT','| LOG_INFO Conversion flight info MIM |');
      grip_etl.log_info ('END Conversion MIM');
   grip_etl.cmd('RECORD_OFF PF_CONVERSION_MIM');


   grip_etl.cmd('RECORD_ON PF_CONVERSION_NUA');
      grip_etl.log_info ('START Conversion NUA');
         grip_etl.trunc_insert('CV_RIS_NUA_ARTICLE_V','BUP_NUA_ARTICLE','| LOG_INFO Conversion Article info NUA |');
         grip_etl.trunc_insert('CV_RIS_NUA_PRODUCT_HIERACHY_V','BUP_NUA_PRODUCT_HIERARCHY','| LOG_INFO Conversion Product Hierarchy NUA |');
         grip_etl.trunc_insert('CV_RIS_NUA_POS_PAYMENT_V','BUP_NUA_POS_PAYMENT','| LOG_INFO Conversion payment info NUA |');
         grip_etl.trunc_insert('CV_RIS_NUA_POS_MARKETING_ATR_V','BUP_NUA_POS_MARKETING_ATR','| LOG_INFO Conversion Marketing info NUA |');
         grip_etl.trunc_insert('CV_RIS_NUA_POS_LINE_ITEM_V','BUP_NUA_POS_LINE_ITEM','| LOG_INFO Conversion sales info NUA |');
         grip_etl.trunc_insert('CV_RIS_NUA_POS_FLIGHT_V','BUP_NUA_POS_FLIGHT','| LOG_INFO Conversion flight info NUA |');
      grip_etl.log_info ('END Conversion NUA');
   grip_etl.cmd('RECORD_OFF PF_CONVERSION_NUA');


   grip_etl.cmd('RECORD_ON PF_CONVERSION_SAR');
      grip_etl.log_info ('START Conversion SAR');
         grip_etl.trunc_insert('CV_RIS_SAR_ARTICLE_V','BUP_SAR_ARTICLE','| LOG_INFO Conversion Article info SAR |');
         grip_etl.trunc_insert('CV_RIS_SAR_PRODUCT_HIERACHY_V','BUP_SAR_PRODUCT_HIERARCHY','| LOG_INFO Conversion Product Hierarchy SAR |');
         grip_etl.trunc_insert('CV_RIS_SAR_POS_PAYMENT_V','BUP_SAR_POS_PAYMENT','| LOG_INFO Conversion payment info SAR |');
         grip_etl.trunc_insert('CV_RIS_SAR_POS_MARKETING_ATR_V','BUP_SAR_POS_MARKETING_ATR','| LOG_INFO Conversion Marketing info SAR |');
         grip_etl.trunc_insert('CV_RIS_SAR_POS_LINE_ITEM_V','BUP_SAR_POS_LINE_ITEM','| LOG_INFO Conversion sales info SAR |');
         grip_etl.trunc_insert('CV_RIS_SAR_POS_FLIGHT_V','BUP_SAR_POS_FLIGHT','| LOG_INFO Conversion flight info SAR |');
      grip_etl.log_info ('END Conversion SAR');
   grip_etl.cmd('RECORD_OFF PF_CONVERSION_SAR');


   grip_etl.cmd('RECORD_ON PF_CONVERSION_WHS');
      grip_etl.log_info ('START Conversion WHS');
         grip_etl.trunc_insert('CV_RIS_WHS_ARTICLE_V','BUP_WHS_ARTICLE','| LOG_INFO Conversion Article info WHS |');
         grip_etl.trunc_insert('CV_RIS_WHS_PRODUCT_HIERACHY_V','BUP_WHS_PRODUCT_HIERARCHY','| LOG_INFO Conversion Product Hierarchy WHS |');
         grip_etl.trunc_insert('CV_RIS_WHS_POS_PAYMENT_V','BUP_WHS_POS_PAYMENT','| LOG_INFO Conversion payment info WHS |');
         grip_etl.trunc_insert('CV_RIS_WHS_POS_MARKETING_ATR_V','BUP_WHS_POS_MARKETING_ATR','| LOG_INFO Conversion Marketing info WHS |');
         grip_etl.trunc_insert('CV_RIS_WHS_POS_LINE_ITEM_V','BUP_WHS_POS_LINE_ITEM','| LOG_INFO Conversion sales info WHS |');
         grip_etl.trunc_insert('CV_RIS_WHS_POS_FLIGHT_V','BUP_WHS_POS_FLIGHT','| LOG_INFO Conversion flight info WHS |');
      grip_etl.log_info ('END Conversion WHS');
   grip_etl.cmd('RECORD_OFF PF_CONVERSION_WHS');


   grip_etl.cmd('RECORD_ON PF_CONVERSION_AKO');
      grip_etl.log_info ('START Conversion AKO');
         grip_etl.trunc_insert('CV_RIS_AKO_ARTICLE_V','BUP_AKO_ARTICLE','| LOG_INFO Conversion Article info AKO |');
         grip_etl.trunc_insert('CV_RIS_AKO_PRODUCT_HIERACHY_V','BUP_AKO_PRODUCT_HIERARCHY','| LOG_INFO Conversion Product Hierarchy AKO |');
         grip_etl.trunc_insert('CV_RIS_AKO_POS_PAYMENT_V','BUP_AKO_POS_PAYMENT','| LOG_INFO Conversion payment info AKO |');
         grip_etl.trunc_insert('CV_RIS_AKO_POS_MARKETING_ATR_V','BUP_AKO_POS_MARKETING_ATR','| LOG_INFO Conversion Marketing info AKO |');
         grip_etl.trunc_insert('CV_RIS_AKO_POS_LINE_ITEM_V','BUP_AKO_POS_LINE_ITEM','| LOG_INFO Conversion sales info AKO |');
         grip_etl.trunc_insert('CV_RIS_AKO_POS_FLIGHT_V','BUP_AKO_POS_FLIGHT','| LOG_INFO Conversion flight info AKO |');
      grip_etl.log_info ('END Conversion AKO');
   grip_etl.cmd('RECORD_OFF PF_CONVERSION_AKO');


   grip_etl.cmd('RECORD_ON PF_CONVERSION_GER');
      grip_etl.log_info ('START Conversion GER');
         grip_etl.trunc_insert('CV_RIS_GER_ARTICLE_V','BUP_GER_ARTICLE','| LOG_INFO Conversion Article info GER |');
         grip_etl.trunc_insert('CV_RIS_GER_PRODUCT_HIERACHY_V','BUP_GER_PRODUCT_HIERARCHY','| LOG_INFO Conversion Product Hierarchy GER |');
         grip_etl.trunc_insert('CV_RIS_GER_POS_PAYMENT_V','BUP_GER_POS_PAYMENT','| LOG_INFO Conversion payment info GER |');
         grip_etl.trunc_insert('CV_RIS_GER_POS_MARKETING_ATR_V','BUP_GER_POS_MARKETING_ATR','| LOG_INFO Conversion Marketing info GER |');
         grip_etl.trunc_insert('CV_RIS_GER_POS_LINE_ITEM_V','BUP_GER_POS_LINE_ITEM','| LOG_INFO Conversion sales info GER |');
         grip_etl.trunc_insert('CV_RIS_GER_POS_FLIGHT_V','BUP_GER_POS_FLIGHT','| LOG_INFO Conversion flight info GER |');
      grip_etl.log_info ('END Conversion GER');
   grip_etl.cmd('RECORD_OFF PF_CONVERSION_GER');


   grip_etl.cmd('RECORD_ON PF_CONVERSION_RIS_RIS3');

         grip_etl.record_job  ('PF_CONVERSION_RIS_RIS3','PF_CONVERSION_AKO','FLOW');
         grip_etl.record_job  ('PF_CONVERSION_RIS_RIS3','PF_CONVERSION_ARA','FLOW');
         grip_etl.record_job  ('PF_CONVERSION_RIS_RIS3','PF_CONVERSION_AVI','FLOW');
         grip_etl.record_job  ('PF_CONVERSION_RIS_RIS3','PF_CONVERSION_CAP','FLOW');
         grip_etl.record_job  ('PF_CONVERSION_RIS_RIS3','PF_CONVERSION_GAS','FLOW');
         grip_etl.record_job  ('PF_CONVERSION_RIS_RIS3','PF_CONVERSION_GER','FLOW');
         grip_etl.record_job  ('PF_CONVERSION_RIS_RIS3','PF_CONVERSION_KAP','FLOW');
         grip_etl.record_job  ('PF_CONVERSION_RIS_RIS3','PF_CONVERSION_LAG','FLOW');
         grip_etl.record_job  ('PF_CONVERSION_RIS_RIS3','PF_CONVERSION_MIM','FLOW');
         grip_etl.record_job  ('PF_CONVERSION_RIS_RIS3','PF_CONVERSION_NUA','FLOW');
         grip_etl.record_job  ('PF_CONVERSION_RIS_RIS3','PF_CONVERSION_SAR','FLOW');
         grip_etl.record_job  ('PF_CONVERSION_RIS_RIS3','PF_CONVERSION_WHS','FLOW');
         grip_etl.record_job  ('PF_CONVERSION_RIS_RIS3','PF_CONVERSION_WOD','FLOW');
   grip_etl.cmd('RECORD_OFF PF_CONVERSION_RIS_RIS3');

END;
/
