---------------------------
--New VIEW
--MD_BUP_KAP_FILESET_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."MD_BUP_KAP_FILESET_V" 
 ( "BUSINESS_PARTNER", "FILE_NAME_MASK", "FILE_DATE", "CHECK_DATE", "LOAD_RESULT"
  )  AS 
  SELECT
/*----------------------------------------------------------------------------------------------------------------------*
 * MD_BUP_KAP_FILESET_V
 * Version  : 2019-41
 * Schema   : RIS_STG
 * Date     : 17-October-2019
 * Developer: Wilco Oosterom [Generator] 
 *
 * Goal: Check on completenes for KAPFiles loaded
 *
 *----------------------------------------------------------------------------------------------------------------------*/
              MDD.BUSINESS_PARTNER
,             'KAP1xxx'||DAT.ID||'.dat'                        FILE_NAME_MASK
,      TO_DATE(DAT.ID, 'YYYYMMDD')                      FILE_DATE
,      SYSDATE                                          CHECK_DATE
,      CASE WHEN FIL.FILE_ID IS NOT NULL
            THEN 'Loaded'                                                   -- File is loaded
            ELSE CASE WHEN MIF.FILE_ID IS NOT NULL                          -- File is not loaded
                      THEN 'Accepted Missing'                               -- File is known to be missing
                      ELSE '<<<Missing>>>'                                  -- File should be present, but is missing
                 END
       END                                              LOAD_RESULT
FROM   MD_BUP_FILE_DELIVERY                                                   MDD -- Compare expected files
JOIN   RIS_DM.D_TIME_DAY                                                      DAT -- Compare with the calender
ON     TO_NUMBER(TO_CHAR(MDD.START_DELIVERY,'YYYYMMDD'))         <= DAT.ID    -- Register only after start_delivery
AND    TO_DATE(TO_CHAR(DAT.ID)||DELIVERY_TIME,'YYYYMMDDHH24:MI') <  SYSDATE   -- Register only if delivery time passed
AND    TO_NUMBER(TO_CHAR(SYSDATE,'YYYYMMDD'))                    >= DAT.ID    -- Do not register files from the future
AND    MDD.BUSINESS_PARTNER = 'KAP'
AND    MDD.CURR_ID = 'Y'
LEFT OUTER JOIN
       (SELECT DISTINCT TO_NUMBER(SUBSTR(FILE_NAME,8,8)) FILE_ID FROM MD_BUP_KAP_FILE)                 FIL --compare with received files
ON     FIL.FILE_ID                                                 =  DAT.ID
LEFT OUTER JOIN MD_BUP_MISSING_FILES                                          MIF --filter out known missing files
ON     MIF.FILE_ID = DAT.ID
AND    MIF.BUSINESS_PARTNER = 'KAP'
AND    MIF.CURR_ID = 'Y'
ORDER BY DAT.ID;
  COMMENT ON TABLE "RPT_VIEW_USER_RIS"."MD_BUP_KAP_FILESET_V" IS 'Version 2019-41';
