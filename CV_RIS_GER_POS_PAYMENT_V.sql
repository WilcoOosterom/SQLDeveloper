---------------------------
--New VIEW
--CV_RIS_GER_POS_PAYMENT_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."CV_RIS_GER_POS_PAYMENT_V" 
 ( "BUP_CODE_SELLER", "BUP_SUBCODE_SELLER", "TOTAL_RECEIPT_AMOUNT", "PAYMENT_TYPE", "PAYMENT_CODE", "SHOP", "POS", "RECEIPT", "SALE_DATE", "SALE_TIME", "NATIONALITY", "BOARDINGPASS_NR", "VOUCHER_AMOUNT", "MARKETING_ATTR_KEY", "ROW_NUMBER", "FILE_NAME", "DATE_CREATED", "VERSION_NUMBER"
  )  AS 
  SELECT
/*------------------------------------------------------------------
*  CV_RIS_GER_POS_PAYMENT_V
*  Generated on: 08-11-2019
*  Version     : 2019-47
*  Developer   : Wilco Oosterom
*  
*  Purpose     : Migrating historical data up to 2016 from RIS
* 
*/------------------------------------------------------------------
       CONS_CODE             BUP_CODE_SELLER
,      CONS_SUBNR            BUP_SUBCODE_SELLER
,      VERKOOPBEDRAG         TOTAL_RECEIPT_AMOUNT
,      BETAALCODE_TYPE       PAYMENT_TYPE
,      BETAALCODE            PAYMENT_CODE
,      SHOP                  SHOP
,      KASSA                 POS
,      BON                   RECEIPT
,      VERKOOPDATUM          SALE_DATE
,      VERKOOPTIJD           SALE_TIME
,      NATIONALITEIT NATIONALITY
,      BOARDINGPASS_NR
,      VOUCHER_BEDRAG        VOUCHER_AMOUNT
,      MKT.MARKETING_ATTR_KEY    MARKETING_ATTR_KEY
,      ROW_NUMBER() OVER (PARTITION BY TRUNC(OPB.DATE_CREATED) ORDER BY SHOP, KASSA, BON)  ROW_NUMBER
,      CONS_CODE||'1POS'||TO_CHAR(OPB.DATE_CREATED,'YYYYMMDD')||'.conv'   FILE_NAME
,      TRUNC(COALESCE(OPB.DATE_CREATED, OPB.DATE_CHANGED))  DATE_CREATED
,      VERSION_NUMBER
FROM RIS.ODS_POS_BETALING OPB
LEFT OUTER JOIN ris.ODS_MARKETING_ATTR MKT
ON MKT.ID = OPB.MAT_ID_FK18
WHERE CONS_CODE NOT IN ('!','?')
AND CONS_CODE = 'GER'
AND TO_CHAR(OPB.DATE_CREATED,'YYYY') <= '2016';
