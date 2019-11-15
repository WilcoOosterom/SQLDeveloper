---------------------------
--New VIEW
--FLH_SAR_POS_FLIGHT_XT_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."FLH_SAR_POS_FLIGHT_XT_V" 
 ( "BUP_CODE_SELLER", "BUP_SUBCODE_SELLER", "SHOP", "POS", "RECEIPT", "SALE_DATE", "SALE_TIME", "PREFIX", "SUFFIX", "DESTINATION_IATA", "FINAL_DESTINATION_IATA", "GATE_CODE", "PASSENGER_CLASS", "EU_NEU_CODE", "ARRIVAL_DEPARTURE", "ROW_NUMBER", "FILE_NAME", "VERSION_NUMBER", "AUD_ID"
  )  AS 
  SELECT 
/*----------------------------------------------------------------------------------------------------------------------*
 * FLH_SAR_POS_FLIGHT_XT_V
 * Version: 1.00.50
 * Schema: RIS_STG
 * Date 09-July-2019
 * Developer: Wilco Oosterom
 * 
 * Goal: Extracting Flight information from the POS file
 * 
 *----------------------------------------------------------------------------------------------------------------------*/
       RTRIM (SUBSTR ( (x.TEXT_LINE), 1, 3))                                                       BUP_CODE_SELLER,
       REPLACE (SUBSTR ( (x.TEXT_LINE), 4, 1), ' ')                                                BUP_SUBCODE_SELLER,
       RTRIM (SUBSTR ( (x.TEXT_LINE), 6, 10))                                                      SHOP,
       RTRIM (SUBSTR ( (x.TEXT_LINE), 16, 10))                                                     POS,
       RTRIM (SUBSTR ( (x.TEXT_LINE), 26, 20))                                                     RECEIPT,
       TO_DATE ((CASE WHEN RTRIM (SUBSTR ( (x.TEXT_LINE), 46, 8)) = '00000000'
                      THEN NULL
                      ELSE RTRIM (SUBSTR ( (x.TEXT_LINE), 46, 8)) END),'YYYYMMDD')                 SALE_DATE,
       TO_NUMBER(REPLACE(SUBSTR((x.TEXT_LINE),54,4),' '),'9999','NLS_NUMERIC_CHARACTERS=,.')       SALE_TIME,
       RTRIM (SUBSTR ( (x.TEXT_LINE), 58, 3))                                                      PREFIX,
       TO_NUMBER(REPLACE(SUBSTR((x.TEXT_LINE),61,4),' '),'9999','NLS_NUMERIC_CHARACTERS=,.')       SUFFIX,
       RTRIM (SUBSTR ( (x.TEXT_LINE), 65, 3))                                                      DESTINATION_IATA,
       RTRIM (SUBSTR ( (x.TEXT_LINE), 68, 3))                                                      FINAL_DESTINATION_IATA,
       RTRIM (SUBSTR ( (x.TEXT_LINE), 71, 3))                                                      GATE_CODE,
       RTRIM (SUBSTR ( (x.TEXT_LINE), 74, 5))                                                      PASSENGER_CLASS,
       (CASE WHEN RTRIM (SUBSTR ( (x.TEXT_LINE), 1, 3)) IN( 'AVI', 'AKO') 
                  and SUBSTR ((x.TEXT_LINE),79,3) = '|||'
             THEN '?'
             ELSE RTRIM( SUBSTR ( (x.TEXT_LINE), 79, 3)) END)                                      EU_NEU_CODE,
       (CASE WHEN RTRIM (SUBSTR ( (x.TEXT_LINE), 1, 3)) IN( 'AVI', 'AKO') 
                  and SUBSTR ((x.TEXT_LINE),82,1) = '|'
             THEN '?'
             ELSE RTRIM (SUBSTR ( (x.TEXT_LINE), 82, 1)) END)                                      ARRIVAL_DEPARTURE,          
       (x.ROW_NUMBER)                                                                              ROW_NUMBER,
       FILE_NAME                                                                                    FILE_NAME,
       CAST('1.00.50' AS VARCHAR2(20 char))                                                       VERSION_NUMBER,
       wbx_parm.get_num ('RIS3SARAUD')                                                                 AUD_ID
FROM   RIS_STG.FLH_SAR_POS_REC x
WHERE  x.RECORD_TYPE = 'D'
AND    CASE x.RECORD_TYPE WHEN 'D' 
                          THEN SUBSTR (x.TEXT_LINE, 5, 1) END =    'V'
AND    rownum <= ris3_test_flow('PF_RIS3_FILES_SAR');
