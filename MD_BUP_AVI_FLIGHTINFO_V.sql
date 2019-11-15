---------------------------
--New VIEW
--MD_BUP_AVI_FLIGHTINFO_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."MD_BUP_AVI_FLIGHTINFO_V" 
 ( "BUP_CODE_SELLER", "BUP_SUBCODE_SELLER", "FILE_NAME", "SALE_DATE", "CHECK_DATE", "ARRIVAL_DEPARTURE", "NR_PREFIX", "NR_SUFFIX", "NR_FLIGHT_DEST", "NR_PAX_DEST", "NR_NO_PREFIX", "NR_NO_SUFFIX", "NR_NO_FLIGHT_DEST", "NR_NO_PAX_DEST", "NR_INVALID_FLIGHT_DEST", "NR_INVALID_PAX_DEST"
  )  AS 
  SELECT
/*----------------------------------------------------------------------------------------------------------------------*
 * MD_BUP_AVI_FLIGHTINFO_V
 * Version  : 2019-41
 * Schema   : RIS_STG
 * Date     : 17-October-2019
 * Developer: Wilco Oosterom [Generator] 
 *
 * Goal: Check on flight information received from AVI
 *
 *----------------------------------------------------------------------------------------------------------------------*/
       BUP_CODE_SELLER
,      BUP_SUBCODE_SELLER
,      FILE_NAME
,      SALE_DATE
,      SYSDATE                                                                              CHECK_DATE
,      ARRIVAL_DEPARTURE
,      SUM(CASE WHEN PREFIX IS NOT NULL THEN 1 ELSE 0 END)                                  NR_PREFIX
,      SUM(CASE WHEN SUFFIX IS NOT NULL THEN 1 ELSE 0 END)                                  NR_SUFFIX
,      SUM(CASE WHEN DESTINATION_IATA IS NOT NULL THEN 1 ELSE 0 END)                        NR_FLIGHT_DEST
,      SUM(CASE WHEN FINAL_DESTINATION_IATA IS NOT NULL THEN 1 ELSE 0 END)                  NR_PAX_DEST
,      SUM(CASE WHEN PREFIX IS NULL THEN 1 ELSE 0 END)                                      NR_NO_PREFIX
,      SUM(CASE WHEN SUFFIX IS NULL THEN 1 ELSE 0 END)                                      NR_NO_SUFFIX
,      SUM(CASE WHEN DESTINATION_IATA IS NULL THEN 1 ELSE 0 END)                            NR_NO_FLIGHT_DEST
,      SUM(CASE WHEN FINAL_DESTINATION_IATA IS NULL THEN 1 ELSE 0 END)                      NR_NO_PAX_DEST
,      SUM(CASE WHEN DESTINATION_IATA NOT IN (SELECT CODE_IATA
                                              FROM RIS_DM.D_DESTINATION
                                              WHERE CURR_ID = 'Y') THEN 1 ELSE 0 END)       NR_INVALID_FLIGHT_DEST
,      SUM(CASE WHEN FINAL_DESTINATION_IATA NOT IN (SELECT CODE_IATA
                                                    FROM RIS_DM.D_DESTINATION
                                                    WHERE CURR_ID = 'Y') THEN 1 ELSE 0 END) NR_INVALID_PAX_DEST
FROM BUP_AVI_POS_FLIGHT
GROUP BY BUP_CODE_SELLER, BUP_SUBCODE_SELLER,FILE_NAME, SALE_DATE,ARRIVAL_DEPARTURE
ORDER BY BUP_CODE_SELLER, BUP_SUBCODE_SELLER, FILE_NAME, SALE_DATE,ARRIVAL_DEPARTURE;
  COMMENT ON TABLE "RPT_VIEW_USER_RIS"."MD_BUP_AVI_FLIGHTINFO_V" IS 'Version 2019-41';
