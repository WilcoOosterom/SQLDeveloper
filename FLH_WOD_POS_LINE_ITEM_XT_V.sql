---------------------------
--New VIEW
--FLH_WOD_POS_LINE_ITEM_XT_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."FLH_WOD_POS_LINE_ITEM_XT_V" 
 ( "BUP_CODE_SELLER", "BUP_SUBCODE_SELLER", "BUP_CODE_OWNER", "ARTICLE_CODE", "NUMBER_OF_ARTICLES", "ITEM_PRICE", "GROSS_AMOUNT", "TAX", "DISCOUNT_AMOUNT", "NET_AMOUNT", "SALE_CODE", "SHOP", "POS", "RECEIPT", "SALE_DATE", "SALE_TIME", "ROW_NUMBER", "FILE_NAME", "VERSION_NUMBER", "AUD_ID"
  )  AS 
  SELECT
/*----------------------------------------------------------------------------------------------------------------------*
 * FLH_WOD_POS_LINE_ITEM_XT_V
 * Version: 1.00.50
 * Schema: RIS_STG
 * Date 09-July-2019
 * Developer: Wilco Oosterom
 *
 * Goal: Extraction of Line item information from the POS file
 *
 *----------------------------------------------------------------------------------------------------------------------*/
       RTRIM (SUBSTR ( (x.TEXT_LINE), 1, 3))                                                           BUP_CODE_SELLER,
       REPLACE(SUBSTR ((x.TEXT_LINE),4,1),' ')                                                         BUP_SUBCODE_SELLER,
       RTRIM (SUBSTR((x.TEXT_LINE),6,3))                                                               BUP_CODE_OWNER,
       LTRIM (RTRIM (SUBSTR ( (x.TEXT_LINE),9,20)), '0')                                               ARTICLE_CODE,
       TO_NUMBER(REPLACE(SUBSTR((x.TEXT_LINE),29,6),' '),'999999','NLS_NUMERIC_CHARACTERS=,.')         NUMBER_OF_ARTICLES,
       TO_NUMBER(REPLACE(SUBSTR((x.TEXT_LINE),35,11),' '),'99999999D99','NLS_NUMERIC_CHARACTERS=,.')   ITEM_PRICE,
       TO_NUMBER(REPLACE(SUBSTR((x.TEXT_LINE),46,11),' '),'99999999D99','NLS_NUMERIC_CHARACTERS=,.')   GROSS_AMOUNT,
       TO_NUMBER(REPLACE(SUBSTR((x.TEXT_LINE),57,11),' '),'99999999D99','NLS_NUMERIC_CHARACTERS=,.')   TAX,
       TO_NUMBER(REPLACE(SUBSTR((x.TEXT_LINE),68,11),' '),'99999999D99','NLS_NUMERIC_CHARACTERS=,.')   DISCOUNT_AMOUNT,
       TO_NUMBER(REPLACE(SUBSTR((x.TEXT_LINE),79,11),' '),'99999999D99','NLS_NUMERIC_CHARACTERS=,.')   NET_AMOUNT,
       TO_NUMBER(REPLACE(SUBSTR((x.TEXT_LINE),90,1),' '),'9','NLS_NUMERIC_CHARACTERS=,.')              SALE_CODE,
       RTRIM (SUBSTR ( (x.TEXT_LINE), 91, 10))                                                         SHOP,
       RTRIM (SUBSTR ( (x.TEXT_LINE), 101, 10))                                                        POS,
       RTRIM (SUBSTR ( (x.TEXT_LINE), 111, 20))                                                        RECEIPT,
       TO_DATE ((CASE WHEN RTRIM (SUBSTR ( (x.TEXT_LINE), 131, 8))='00000000'
                      THEN NULL
                      ELSE RTRIM (SUBSTR ( (x.TEXT_LINE), 131, 8))END),'YYYYMMDD')                     SALE_DATE,
       TO_NUMBER(REPLACE(SUBSTR((x.TEXT_LINE),139,4),' '),'9999','NLS_NUMERIC_CHARACTERS=,.')          SALE_TIME,
       x.ROW_NUMBER                                                                                    ROW_NUMBER,
       FILE_NAME                                                                                     FILE_NAME,
       CAST('1.00.50' AS VARCHAR2(20 char))                                                               VERSION_NUMBER,
       wbx_parm.get_num ('RIS3WODAUD')                                                                     AUD_ID
FROM   RIS_STG.FLH_WOD_POS_REC x
WHERE  x.RECORD_TYPE = 'D'
AND    CASE x.RECORD_TYPE WHEN 'D' THEN SUBSTR (x.TEXT_LINE, 5, 1) END = 'A';
