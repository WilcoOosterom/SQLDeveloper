---------------------------
--New VIEW
--CV_RIS_ARA_ARTICLE_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."CV_RIS_ARA_ARTICLE_V" 
 ( "BUP_CODE_OWNER", "BUP_SUBCODE_OWNER", "ARTICLE_CODE", "ARTICLE_DESC", "ARTICLE_CATEGORY", "ROW_NUMBER", "FILE_NAME", "DATE_CREATED", "VERSION_NUMBER"
  )  AS 
  SELECT
/*------------------------------------------------------------------
*  CV_RIS_ARA_ARTICLE_V
*  Generated on: 08-11-2019
*  Version     : 2019-47
*  Developer   : Wilco Oosterom
*
*  Purpose     : Migrating historical data up to 2016 from RIS
*
*/------------------------------------------------------------------
       CONS_CODE             BUP_CODE_OWNER
,      CONS_SUBNR            BUP_SUBCODE_OWNER
,      ARTIKEL               ARTICLE_CODE
,      ARTIKEL_OMS           ARTICLE_DESC
,      ARTCAT                ARTICLE_CATEGORY
,      ROW_NUMBER() OVER (PARTITION BY TRUNC(DATE_CREATED) ORDER BY ARTIKEL)  ROW_NUMBER
,      CONS_CODE||'1ART'||TO_CHAR(DATE_CREATED,'YYYYMMDD')||'.conv'   FILE_NAME
,      TRUNC(DATE_CREATED)   DATE_CREATED
,      VERSION_NUMBER
FROM RIS.ODS_ARTIKEL
WHERE CONS_CODE = 'ARA'
AND TO_CHAR(DATE_CREATED,'YYYY') <= '2016'
ORDER BY DATE_CREATED;
