---------------------------
--New VIEW
--CV_RIS_ARA_PRODUCT_HIERACHY_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."CV_RIS_ARA_PRODUCT_HIERACHY_V" 
 ( "BUP_CODE_OWNER", "BUP_SUBCODE_OWNER", "ARTICLE_CATEGORY", "ARTICLE_CATEGORY_DESC", "MAIN_ARTICLE_CATEGORY", "MAIN_ARTICLE_CATEGORY_DESC", "ROW_NUMBER", "FILE_NAME", "DATE_CREATED", "VERSION_NUMBER"
  )  AS 
  SELECT
/*------------------------------------------------------------------
*  CV_RIS_ARA_PRODUCT_HIERACHY_V
*  Generated on: 08-11-2019
*  Version     : 2019-47
*  Developer   : Wilco Oosterom
*
*  Purpose     : Migrating historical data up to 2016 from RIS
*
*/------------------------------------------------------------------
       CONS_CODE             BUP_CODE_OWNER
,      CONS_SUBNR            BUP_SUBCODE_OWNER
,      ARTCAT                ARTICLE_CATEGORY
,      ARTCAT_OMS            ARTICLE_CATEGORY_DESC
,      HOOFD_ARTCAT          MAIN_ARTICLE_CATEGORY
,      HOOFD_ARTCAT_OMS      MAIN_ARTICLE_CATEGORY_DESC
,      ROW_NUMBER() OVER (PARTITION BY TRUNC(DATE_CREATED) ORDER BY ARTCAT)  ROW_NUMBER
,      CONS_CODE||'1PRH'||TO_CHAR(DATE_CREATED,'YYYYMMDD')||'.conv'   FILE_NAME
,      TRUNC(COALESCE(DATE_CREATED, DATE_CHANGED))  DATE_CREATED
,      VERSION_NUMBER
FROM RIS.ODS_ARTCAT
WHERE CONS_CODE = 'ARA'
ORDER BY DATE_CREATED;
