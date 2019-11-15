---------------------------
--New VIEW
--FLH_SAR_POS_PAYMENT_XT_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."FLH_SAR_POS_PAYMENT_XT_V" 
 ( "BUP_CODE_SELLER", "BUP_SUBCODE_SELLER", "TOTAL_RECEIPT_AMOUNT", "PAYMENT_TYPE", "PAYMENT_CODE", "SHOP", "POS", "RECEIPT", "SALE_DATE", "SALE_TIME", "NATIONALITY", "BOARDINGPASS_NR", "VOUCHER_AMOUNT", "MARKETING_ATTR_KEY", "ROW_NUMBER", "FILE_NAME", "VERSION_NUMBER", "AUD_ID"
  )  AS 
  SELECT
/*----------------------------------------------------------------------------------------------------------------------*
 * FLH_SAR_POS_ART_PAYMENT_XT_V
 * Version: 1.00.50
 * Schema: RIS_STG
 * Date 05-July-2019
 * Developer: Wilco Oosterom
 *
 * Goal: Extraction of payment information from POS file
 *
 *----------------------------------------------------------------------------------------------------------------------*/
       RTRIM(SUBSTR((x.TEXT_LINE),1,3))                                                                                           BUP_CODE_SELLER,
       REPLACE(SUBSTR((x.TEXT_LINE),4,1),' ')                                                                                     BUP_SUBCODE_SELLER,
       TO_NUMBER(REPLACE(SUBSTR((x.TEXT_LINE),6,12),' '),'999999999D99','NLS_NUMERIC_CHARACTERS=,.')                              TOTAL_RECEIPT_AMOUNT,
       TO_NUMBER(REPLACE(SUBSTR((x.TEXT_LINE),18,1),' '),'9','NLS_NUMERIC_CHARACTERS=,.')                                         PAYMENT_TYPE,
       TO_NUMBER(REPLACE(SUBSTR((x.TEXT_LINE),19,3),' '),'999','NLS_NUMERIC_CHARACTERS=,.')                                       PAYMENT_CODE,
       RTRIM(SUBSTR((x.TEXT_LINE),22,10))                                                                                         SHOP,
       RTRIM(SUBSTR((x.TEXT_LINE),32,10))                                                                                         POS,
       RTRIM(SUBSTR((x.TEXT_LINE),42,20))                                                                                         RECEIPT,
       TO_DATE((CASE WHEN RTRIM(SUBSTR((x.TEXT_LINE),62,8))='00000000'                                                            
                     THEN NULL                                                                                                    
                     ELSE RTRIM(SUBSTR((x.TEXT_LINE),62,8)) END),'YYYYMMDD')                                                      SALE_DATE,
       TO_NUMBER(REPLACE(SUBSTR((x.TEXT_LINE),70,4),' '),'9999','NLS_NUMERIC_CHARACTERS=,.')                                      SALE_TIME,
       REPLACE(REPLACE(TRIM(SUBSTR((x.TEXT_LINE),74,2)),CHR (13), ''),REPLACE(TRIM(SUBSTR((x.TEXT_LINE),74,2)),CHR (13),''),'  ') NATIONALITY,
       CAST(RTRIM(REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,1),';')  AS varchar2(40 char))                         BOARDINGPASS_NR,
       CASE WHEN INSTR(X.TEXT_LINE,';',1,31)=0
            THEN NULL
            ELSE TO_NUMBER (REGEXP_REPLACE(SUBSTR(X.TEXT_LINE,INSTR(X.TEXT_LINE,';', 1,31)+1),'\s'),'999999999D99', 'NLS_NUMERIC_CHARACTERS=,.') 
            	   --get the character(s) after the last semicolon and replace the CR and LF characters
            END                                                                                                                   VOUCHER_AMOUNT,
      SUBSTR(x.TEXT_LINE,INSTR (x.TEXT_LINE,';',1,1),INSTR (x.TEXT_LINE,';',-1,1)-INSTR (x.TEXT_LINE,';',1,1)+1)                  MARKETING_ATTR_KEY,
                 -- get the character(s) in between the first semicolon and the last semicolon

       x.ROW_NUMBER                                                                                                              ROW_NUMBER,
       FILE_NAME                                                                                                                 FILE_NAME,
       CAST('1.00.50' AS VARCHAR2(20 char))                                                                                  VERSION_NUMBER,
       wbx_parm.get_num ('RIS3SARAUD')                                                                                               AUD_ID
FROM   RIS_STG.FLH_SAR_POS_REC x
WHERE  x.RECORD_TYPE = 'D'
AND    CASE x.RECORD_TYPE WHEN 'D' 
                          THEN SUBSTR (x.TEXT_LINE,5,1) END ='B'
AND    rownum <= ris3_test_flow('PF_RIS3_FILES_SAR');
