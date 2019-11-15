---------------------------
--New VIEW
--MD_BUP_CAP_AMOUNTS_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."MD_BUP_CAP_AMOUNTS_V" 
 ( "BUP_CODE_SELLER", "BUP_SUBCODE_SELLER", "FILE_NAME", "SALE_DATE", "CHECK_DATE", "LI_NUMBER_OF_ITEM_LINES", "LI_NUMBER_OF_ARTICLES", "LI_TOTAL_NET_AMOUNT", "LI_TOTAL_GROSS_AMOUNT", "LI_TOTAL_TAX_AMOUNT", "LI_TOTAL_DISCOUNT_AMOUNT", "PT_TOTAL_AMOUNT", "PT_TOTAL_VOUCHER_AMOUNT", "PT_NR_VOUCHERS", "LI_NR_RECEIPTS", "PT_NR_RECEIPTS", "PAYMENT_NO_LINE_ITEMS", "LINE_ITEMS_NO_PAYMENT", "MULTIPLE_PAYMENTLINES"
  )  AS 
  WITH 
/*----------------------------------------------------------------------------------------------------------------------*
 * MD_BUP_CAP_AMOUNTS_V
 * Version  : 2019-41
 * Schema   : RIS_STG
 * Date     : 17-October-2019
 * Developer: Wilco Oosterom [Generator] 
 *
 * Goal: Check on Amounts and receipts CAPFiles loaded
 *
 *----------------------------------------------------------------------------------------------------------------------*/
LINE_ITEM AS (
     SELECT BUP_CODE_SELLER
     , BUP_SUBCODE_SELLER
     , FILE_NAME
     , SALE_DATE
     , COUNT(1) LI_NUMBER_OF_ITEM_LINES
     , SUM(NUMBER_OF_ARTICLES) LI_NUMBER_OF_ARTICLES
     , SUM(NET_AMOUNT) LI_TOTAL_NET_AMOUNT
     , SUM(GROSS_AMOUNT) LI_TOTAL_GROSS_AMOUNT
     , SUM(TAX) LI_TOTAL_TAX_AMOUNT
     , SUM(DISCOUNT_AMOUNT) LI_TOTAL_DISCOUNT_AMOUNT
     , COUNT(DISTINCT ('S'||SHOP||'P'||POS||'R'||RECEIPT)) LI_NR_RECEIPTS 
     FROM BUP_CAP_POS_LINE_ITEM
     WHERE CURR_ID='Y'
     GROUP BY BUP_CODE_SELLER, BUP_SUBCODE_SELLER,FILE_NAME, SALE_DATE
     ORDER BY FILE_NAME, SALE_DATE),
PAYMENT AS (
     SELECT FILE_NAME
     , SALE_DATE
     , COUNT(1) PT_NR_RECEIPTS
     , SUM(TOTAL_RECEIPT_AMOUNT) PT_TOTAL_AMOUNT
     , SUM(COALESCE(VOUCHER_AMOUNT,0)) PT_TOTAL_VOUCHER_AMOUNT
     , SUM (CASE WHEN VOUCHER_AMOUNT IS NOT NULL THEN 1 ELSE 0 END)PT_NR_VOUCHERS
     FROM BUP_CAP_POS_PAYMENT
     WHERE CURR_ID='Y'
     GROUP BY FILE_NAME, SALE_DATE
     ORDER BY FILE_NAME, SALE_DATE)
SELECT LINE_ITEM.BUP_CODE_SELLER
,      LINE_ITEM.BUP_SUBCODE_SELLER
,      LINE_ITEM.FILE_NAME
,      LINE_ITEM.SALE_DATE
,      SYSDATE   CHECK_DATE
,      LINE_ITEM.LI_NUMBER_OF_ITEM_LINES
,      LINE_ITEM.LI_NUMBER_OF_ARTICLES
,      LINE_ITEM.LI_TOTAL_NET_AMOUNT
,      LINE_ITEM.LI_TOTAL_GROSS_AMOUNT
,      LINE_ITEM.LI_TOTAL_TAX_AMOUNT
,      LINE_ITEM.LI_TOTAL_DISCOUNT_AMOUNT
,      PAYMENT.PT_TOTAL_AMOUNT
,      PAYMENT.PT_TOTAL_VOUCHER_AMOUNT
,      PAYMENT.PT_NR_VOUCHERS
,      LINE_ITEM.LI_NR_RECEIPTS
,      PAYMENT.PT_NR_RECEIPTS
--payments without line items
,      (SELECT COUNT(*) FROM ((SELECT bup_code_seller, bup_subcode_seller, shop, pos, sale_date, sale_time,receipt,file_name FROM BUP_AKO_POS_PAYMENT ckpm
         WHERE ckpm.file_name =  payment.file_name) 
        MINUS
        (SELECT bup_code_seller, bup_subcode_seller, shop, pos, sale_date, sale_time,receipt,file_name FROM BUP_AKO_POS_LINE_ITEM ckli
         WHERE ckli.file_name = line_item.file_name))) PAYMENT_NO_LINE_ITEMS
--Line items without payments
,      (SELECT COUNT(*) FROM ((SELECT bup_code_seller, bup_subcode_seller, shop, pos, sale_date, sale_time,receipt,file_name FROM BUP_AKO_POS_LINE_ITEM ckli
         WHERE ckli.file_name = line_item.file_name)
        MINUS
        (SELECT bup_code_seller, bup_subcode_seller, shop, pos, sale_date, sale_time,receipt,file_name FROM BUP_AKO_POS_PAYMENT ckpm
         WHERE ckpm.file_name =  payment.file_name))) LINE_ITEMS_NO_PAYMENT
-- Multiple identical payment lines
,       (SELECT count(*) FROM
          (SELECT bup_code_seller, bup_subcode_seller,SHOP,POS,RECEIPT, SALE_DATE, SALE_TIME, count(*) FROM BUP_AKO_POS_PAYMENT pmt
           WHERE PMT.FILE_NAME = PAYMENT.FILE_NAME
           GROUP BY bup_code_seller, bup_subcode_seller,SHOP,POS,RECEIPT, SALE_DATE, SALE_TIME HAVING count(*) > 1)) MULTIPLE_PAYMENTLINES
FROM PAYMENT
JOIN LINE_ITEM
ON   LINE_ITEM.FILE_NAME = PAYMENT.FILE_NAME
AND  LINE_ITEM.SALE_DATE = PAYMENT.SALE_DATE;
  COMMENT ON TABLE "RPT_VIEW_USER_RIS"."MD_BUP_CAP_AMOUNTS_V" IS 'Version 2019-41';
