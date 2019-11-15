---------------------------
--New VIEW
--MD_BUP_SAR_FILE_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."MD_BUP_SAR_FILE_V" 
 ( "BUSINESS_PARTNER", "FILE_NAME", "FILETYPE", "PROCESSDATE", "ROW_FROM", "ROW_TO", "ROW_READ_CALC", "ROW_DELIVERY", "ROW_READ_ACTUAL", "FILE_CONSISTENT", "FILE_COMPLETE", "VERSION_NUMBER"
  )  AS 
  SELECT
/*----------------------------------------------------------------------------------------------------------------------*
 * MD_BUP_SAR_FILE_V
 * Version  : 2019-41
 * Schema   : RIS_STG
 * Date     : 17-October-2019
 * Developer: Wilco Oosterom [Generator] 
 *
 * Goal: File read metadata, check on completenes for SAR
 *
 *----------------------------------------------------------------------------------------------------------------------*/
       BUSINESS_PARTNER, FILE_NAME, FILETYPE,PROCESSDATE, ROW_FROM, ROW_TO, ROW_READ_CALC, ROW_DELIVERY, ROW_READ_ACTUAL
,      CASE WHEN ROW_READ_CALC <> ROW_DELIVERY THEN 'N'
            ELSE 'Y' END FILE_CONSISTENT
,      CASE WHEN ROW_READ_CALC <> ROW_READ_ACTUAL THEN 'N'
            ELSE 'Y' END FILE_COMPLETE
,      CAST('2019-41' AS VARCHAR2(20 CHAR)) VERSION_NUMBER FROM
      (SELECT 'SAR'     BUSINESS_PARTNER
       ,      HDR.FILE_NAME
       ,      HDR.FILETYPE
       ,      HDR.ROW_NUMBER ROW_FROM
       ,      FTR.ROW_NUMBER ROW_TO
       ,      FTR.ROW_NUMBER - (HDR.ROW_NUMBER +1) ROW_READ_CALC
       ,      TO_NUMBER(SUBSTR(SUBSTR(FTR.TEXT_LINE, INSTR(FTR.TEXT_LINE, '.dat')),INSTR(SUBSTR(FTR.TEXT_LINE, INSTR(FTR.TEXT_LINE, '.dat')), '0'))) ROW_DELIVERY
       ,      (CASE WHEN HDR.FILETYPE = 'POS' THEN (SELECT SUM(AANTAL) FROM (
                           SELECT COUNT(*) AANTAL FROM BUP_SAR_POS_FLIGHT A WHERE A.FILE_NAME = HDR.FILE_NAME UNION ALL
                           SELECT COUNT(*) AANTAL FROM BUP_SAR_POS_PAYMENT A WHERE A.FILE_NAME = HDR.FILE_NAME UNION ALL
                           SELECT COUNT(*) AANTAL FROM BUP_SAR_POS_LINE_ITEM A WHERE A.FILE_NAME = HDR.FILE_NAME ))
                    WHEN HDR.FILETYPE = 'ART' THEN (SELECT COUNT(*) AANTAL FROM BUP_SAR_ARTICLE A WHERE A.FILE_NAME = HDR.FILE_NAME)
                    WHEN HDR.FILETYPE = 'PRH' THEN (SELECT COUNT(*) AANTAL FROM BUP_SAR_PRODUCT_HIERARCHY A WHERE A.FILE_NAME = HDR.FILE_NAME)
                    ELSE -1 END) ROW_READ_ACTUAL
       ,      HDR.PROCESSDATE
       FROM   FLH_SAR_METADATA HDR
       JOIN   FLH_SAR_METADATA FTR
       ON     HDR.FILE_NAME   = FTR.FILE_NAME 
       AND    HDR.PROCESSDATE = FTR.PROCESSDATE
       AND    FTR.RECORD_TYPE = 'F'
       AND    HDR.RECORD_TYPE = 'H'
        ) SRC
       WHERE NOT EXISTS
       (SELECT 1 FROM MD_BUP_SAR_FILE TGT WHERE SRC.BUSINESS_PARTNER = TGT.BUSINESS_PARTNER AND SRC.FILE_NAME = TGT.FILE_NAME AND SRC.FILETYPE = TGT.FILETYPE AND SRC.PROCESSDATE = TGT.PROCESSDATE);
  COMMENT ON TABLE "RPT_VIEW_USER_RIS"."MD_BUP_SAR_FILE_V" IS 'Version 2019-41';
