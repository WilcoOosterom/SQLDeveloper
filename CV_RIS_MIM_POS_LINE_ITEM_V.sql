---------------------------
--New VIEW
--CV_RIS_MIM_POS_LINE_ITEM_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."CV_RIS_MIM_POS_LINE_ITEM_V" 
 ( "BUP_CODE_SELLER", "BUP_SUBCODE_SELLER", "BUP_CODE_OWNER", "ARTICLE_CODE", "NUMBER_OF_ARTICLES", "ITEM_PRICE", "GROSS_AMOUNT", "TAX", "DISCOUNT_AMOUNT", "NET_AMOUNT", "SALE_CODE", "SHOP", "POS", "RECEIPT", "SALE_DATE", "SALE_TIME", "ROW_NUMBER", "FILE_NAME", "DATE_CREATED", "VERSION_NUMBER"
  )  AS 
  SELECT
/*------------------------------------------------------------------
*  CV_RIS_MIM_POS_LINE_ITEM_V
*  Generated on: 08-11-2019
*  Version     : 2019-47
*  Developer   : Wilco Oosterom
*  
*  Purpose     : Migrating historical data up to 2016 from RIS
* 
*/------------------------------------------------------------------
       S.CONS_CODE             BUP_CODE_SELLER
,      S.CONS_SUBNR            BUP_SUBCODE_SELLER
,      S.ART_CONS_CODE         BUP_CODE_OWNER
,      S.ARTIKEL               ARTICLE_CODE
,      S.AANTAL                NUMBER_OF_ARTICLES
,      S.VERKOOP_PRIJS         ITEM_PRICE
,      S.BRUTO_BEDRAG          GROSS_AMOUNT
,      S.BTW                   TAX
,      S.KORTING_BEDRAG        DISCOUNT_AMOUNT
,      S.NETTO_BEDRAG          NET_AMOUNT
,      S.VERKOOP_CODE          SALE_CODE
,      S.SHOP                  SHOP
,      S.KASSA                 POS
,      S.BON                   RECEIPT
,      S.VERKOOPDATUM          SALE_DATE
,      S.VERKOOPTIJD           SALE_TIME
,      S.VOLG_NR               ROW_NUMBER
,      S.CONS_CODE||'1POS'||TO_CHAR(S.DATE_CREATED,'YYYYMMDD')||'.conv'   FILE_NAME
,      TRUNC(COALESCE(S.DATE_CREATED, S.DATE_CHANGED))  DATE_CREATED
,      S.VERSION_NUMBER
FROM RIS.ODS_POS_ART_VERKOOP S
WHERE S.CONS_CODE NOT IN ('!','?')
AND S.CONS_CODE = 'MIM'
AND TO_CHAR(S.DATE_CREATED,'YYYY') <= '2016'
ORDER BY S.DATE_CREATED;
