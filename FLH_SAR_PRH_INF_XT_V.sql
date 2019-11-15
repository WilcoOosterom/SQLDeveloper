---------------------------
--New VIEW
--FLH_SAR_PRH_INF_XT_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."FLH_SAR_PRH_INF_XT_V" 
 ( "BUP_CODE_OWNER", "BUP_SUBCODE_OWNER", "ARTICLE_CATEGORY", "ARTICLE_CATEGORY_DESC", "MAIN_ARTICLE_CATEGORY", "MAIN_ARTICLE_CATEGORY_DESC", "ROW_NUMBER", "FILE_NAME", "VERSION_NUMBER", "AUD_ID"
  )  AS 
  SELECT
/*----------------------------------------------------------------------------------------------------------------------*
 * FLH_SAR_PRH_INF_XT_V
 * Version: 1.00.50
 * Schema: RIS_STG
 * Date 09-July-2019
 * Developer: Wilco Oosterom
 *
 * Goal: Extract of information from the PRH file
 *
 *----------------------------------------------------------------------------------------------------------------------*/
DISTINCT
       RTRIM(SUBSTR(TEXT_LINE,1,3))                                                        BUP_CODE_OWNER,
       REPLACE(SUBSTR(TEXT_LINE,4,1),' ')                                                   BUP_SUBCODE_OWNER,  
       LTRIM(RTRIM(SUBSTR(TEXT_LINE,5,20)),'0')                                            ARTICLE_CATEGORY,
       RTRIM(SUBSTR(TEXT_LINE,25,50))                                                      ARTICLE_CATEGORY_DESC,
       LTRIM(RTRIM(SUBSTR(TEXT_LINE,75,20)),'0')                                           MAIN_ARTICLE_CATEGORY,
       RTRIM(SUBSTR(TEXT_LINE,95,50))                                                      MAIN_ARTICLE_CATEGORY_DESC,
       ROW_NUMBER                                                                          ROW_NUMBER,
       FILE_NAME                                                                          FILE_NAME,
       CAST('1.00.50' AS VARCHAR2(20 char))                                                 VERSION_NUMBER,
       wbx_parm.get_num ('RIS3SARAUD')                                                         AUD_ID
FROM   RIS_STG.FLH_SAR_PRH_REC
WHERE  RECORD_TYPE   = 'D'
AND    rownum <= ris3_test_flow('PF_RIS3_FILES_SAR');
