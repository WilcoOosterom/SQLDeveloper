---------------------------
--New VIEW
--FLH_SAR_ART_INF_XT_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."FLH_SAR_ART_INF_XT_V" 
 ( "BUP_CODE_OWNER", "BUP_SUBCODE_OWNER", "ARTICLE_CODE", "ARTICLE_DESC", "ARTICLE_CATEGORY", "ROW_NUMBER", "FILE_NAME", "VERSION_NUMBER", "AUD_ID"
  )  AS 
  SELECT 
/*----------------------------------------------------------------------------------------------------------------------*
 * FLH_SAR_ART_INF_XT_V
 * Version: 1.00.50
 * Schema: RIS_STG
 * Date 09-July-2019
 * Developer: Wilco Oosterom
 * 
 * Goal: Laden van informatie uit het ART file
 * 
 *----------------------------------------------------------------------------------------------------------------------*/
DISTINCT 
       RTRIM(SUBSTR(TEXT_LINE,1,3))                                                         BUP_CODE_OWNER,  
       REPLACE(SUBSTR(TEXT_LINE,4,1),' ')                                                   BUP_SUBCODE_OWNER,  
       LTRIM(RTRIM(SUBSTR(TEXT_LINE,5,20)),'0')                                             ARTICLE_CODE, 
       RTRIM(SUBSTR(TEXT_LINE,25,50))                                                       ARTICLE_DESC, 
       LTRIM(RTRIM(SUBSTR(TEXT_LINE,75,20)),'0')                                            ARTICLE_CATEGORY, 
       ROW_NUMBER                                                                           ROW_NUMBER,
       FILE_NAME                                                                            FILE_NAME,
       CAST('1.00.50' AS VARCHAR2(20 char))                                                VERSION_NUMBER,
       wbx_parm.get_num ('RIS3SARAUD')                                                          AUD_ID
FROM   RIS_STG.FLH_SAR_ART_REC   
WHERE  RECORD_TYPE   = 'D'
AND    rownum <= ris3_test_flow('PF_RIS3_FILES_SAR');
