---------------------------
--New VIEW
--FLH_SAR_ART_METADATA_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."FLH_SAR_ART_METADATA_V" 
 ( "FILETYPE", "RECORD_TYPE", "TEXT_LINE", "ROW_NUMBER", "FILE_NAME", "PROCESSDATE"
  )  AS 
  SELECT 
/*----------------------------------------------------------------------------------------------------------------------*
 * FLH_SAR_ART_METADATA_V
 * Version  : 2019-33
 * Schema   : RIS_STG
 * Date     : 31-July-2019
 * Developer: Wilco Oosterom
 * 
 * Goal: Extracting metadata from ART file
 * 
 *----------------------------------------------------------------------------------------------------------------------*/
   CAST('ART' AS VARCHAR2(20 char)) FILETYPE
, RECORD_TYPE
, TEXT_LINE
, "ROW_NUMBER"
, FILE_NAME
, SYSDATE        Processdate
FROM RIS_STG.FLH_SAR_ART_REC
WHERE record_type <> 'D';
