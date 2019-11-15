---------------------------
--New VIEW
--FLH_WOD_POS_XT_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."FLH_WOD_POS_XT_V" 
 ( "RECORD_TYPE", "TEXT_LINE", "ROW_NUMBER", "FILE_NAME"
  )  AS 
  SELECT 
/*----------------------------------------------------------------------------------------------------------------------*
 * FLH_WOD_POS_XT_V
 * Version: 1.00.50
 * Schema: RIS_STG
 * Date 09-July-2019
 * Developer: Peter de Boer
 *
 * Goal: Ophalen data uit file POS voor WOD
 *
 *----------------------------------------------------------------------------------------------------------------------*/
  record_type 
, rtrim(text_line,chr(13))              text_line 
, row_number
, file_name
from (select x.record_type                                                record_type
      ,      x.text_line                                                  text_line  
      ,      rownum                                                       row_number
      ,      substr(x.text_line,1,4)||'POS'||fst.file_set_name||'.dat'    file_name
      from flh_WOD_pos_xt x
      join grip_flh_file_sets fst on 1=1 
      where fst.current_ind = 'Y' 
      and   substr(x.text_line,1,3) = 'WOD'
      and   fst.fk_db_directory = 'RIS3_WOD_PROCESSING');
