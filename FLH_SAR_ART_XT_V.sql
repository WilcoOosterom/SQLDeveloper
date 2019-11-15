---------------------------
--New VIEW
--FLH_SAR_ART_XT_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."FLH_SAR_ART_XT_V" 
 ( "RECORD_TYPE", "TEXT_LINE", "ROW_NUMBER", "FILE_NAME"
  )  AS 
  SELECT 
/*----------------------------------------------------------------------------------------------------------------------*
 * FLH_SAR_ART_XT_V
 * Version: 1.00.50
 * Schema: RIS_STG
 * Date 09-July2019
 * Developer: Peter de Boer
 *
 * Goal: Ophalen data uit file ART 
 *
 *----------------------------------------------------------------------------------------------------------------------*/
  record_type 
, rtrim(text_line,chr(13))                text_line 
, row_number
, file_name 
from (select x.record_type                                            record_type
      ,      case when substr(x.text_line,1,3)='SAR' 
                  then convert(x.text_line,'WE8MSWIN1252','UTF8')  
                  else  x.text_line 
             end                                                      text_line  
      ,      rownum                                                   row_number
      ,      substr(x.text_line,1,4)||'ART'||File_SET_NAME||'.dat'    File_name
      from flh_sar_art_xt x
      join GRIP_FLH_FILE_SETS ON 1=1 
      WHERE current_ind = 'Y' 
      and  substr(x.text_line,1,3) = 'SAR' 
      AND FK_DB_DIRECTORY = 'RIS3_SAR_PROCESSING');
