---------------------------
--New VIEW
--FLH_WOD_POS_METADATA_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."FLH_WOD_POS_METADATA_V" 
 ( "FILETYPE", "RECORD_TYPE", "TEXT_LINE", "ROW_NUMBER", "FILE_NAME", "PROCESSDATE"
  )  AS 
  SELECT 
/*----------------------------------------------------------------------------------------------------------------------*
 * FLH_WOD_POS_METADATA_V
 * Version  : 2019-33
 * Schema   : RIS_STG
 * Date     : 31-July-2019
 * Developer: Wilco Oosterom
 * 
 * Goal: Extracting metadata from POS file
 * 
 *----------------------------------------------------------------------------------------------------------------------*/
   CAST('POS' AS VARCHAR2(20 char)) FILETYPE
, RECORD_TYPE
, TEXT_LINE
, "ROW_NUMBER"
, FILE_NAME
, SYSDATE        Processdate
FROM RIS_STG.FLH_WOD_POS_REC
WHERE record_type <> 'D'
OR    (record_type = 'D' AND SUBSTR (TEXT_LINE,5,1) NOT IN ('A','B','V'));
