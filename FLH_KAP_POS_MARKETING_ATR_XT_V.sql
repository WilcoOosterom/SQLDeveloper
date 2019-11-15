---------------------------
--New VIEW
--FLH_KAP_POS_MARKETING_ATR_XT_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."FLH_KAP_POS_MARKETING_ATR_XT_V" 
 ( "BUP_CODE_SELLER", "BUP_SUBCODE_SELLER", "MARKETING_ATTR_KEY", "MARKETING_ATTR1", "MARKETING_ATTR2", "MARKETING_ATTR3", "MARKETING_ATTR4", "MARKETING_ATTR5", "MARKETING_ATTR6", "MARKETING_ATTR7", "MARKETING_ATTR8", "MARKETING_ATTR9", "MARKETING_ATTR10", "MARKETING_ATTR11", "MARKETING_ATTR12", "MARKETING_ATTR13", "MARKETING_ATTR14", "MARKETING_ATTR15", "MARKETING_ATTR16", "MARKETING_ATTR17", "MARKETING_ATTR18", "MARKETING_ATTR19", "MARKETING_ATTR20", "MARKETING_ATTR21", "MARKETING_ATTR22", "MARKETING_ATTR23", "MARKETING_ATTR24", "MARKETING_ATTR25", "MARKETING_ATTR26", "MARKETING_ATTR27", "MARKETING_ATTR28", "MARKETING_ATTR29", "MARKETING_ATTR30", "ROW_NUMBER", "FILE_NAME", "VERSION_NUMBER", "AUD_ID"
  )  AS 
  SELECT
/*----------------------------------------------------------------------------------------------------------------------*
 * FLH_AVI_POS_MARKETING_ATR_XT_V
 * Version: 1.00.50
 * Schema: RIS_STG
 * Date 09-July-2019
 * Developer: Wilco Oosterom
 *
 * Goal: Extraction of Marketing information from the POS file
 *
 *----------------------------------------------------------------------------------------------------------------------*/
       SUBSTR(x.TEXT_LINE,1,3)                                                                                        BUP_CODE_SELLER,
       SUBSTR(x.TEXT_LINE,4,1)                                                                                        BUP_SUBCODE_SELLER,
       SUBSTR(x.TEXT_LINE,INSTR(x.TEXT_LINE,';',1,1)+0,INSTR (x.TEXT_LINE,';',1,31)-INSTR(x.TEXT_LINE,';',1,1)+1)     MARKETING_ATTR_KEY,
              -- get the character(s) from the first semicolon to the last semicolon
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,2),';')                                         MARKETING_ATTR1,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,3),';')                                         MARKETING_ATTR2,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,4),';')                                         MARKETING_ATTR3,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,5),';')                                         MARKETING_ATTR4,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,6),';')                                         MARKETING_ATTR5,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,7),';')                                         MARKETING_ATTR6,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,8),';')                                         MARKETING_ATTR7,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,9),';')                                         MARKETING_ATTR8,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,10),';')                                        MARKETING_ATTR9,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,11),';')                                        MARKETING_ATTR10,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,12),';')                                        MARKETING_ATTR11,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,13),';')                                        MARKETING_ATTR12,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,14),';')                                        MARKETING_ATTR13,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,15),';')                                        MARKETING_ATTR14,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,16),';')                                        MARKETING_ATTR15,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,17),';')                                        MARKETING_ATTR16,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,18),';')                                        MARKETING_ATTR17,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,19),';')                                        MARKETING_ATTR18,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,20),';')                                        MARKETING_ATTR19,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,21),';')                                        MARKETING_ATTR20,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,22),';')                                        MARKETING_ATTR21,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,23),';')                                        MARKETING_ATTR22,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,24),';')                                        MARKETING_ATTR23,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,25),';')                                        MARKETING_ATTR24,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,26),';')                                        MARKETING_ATTR25,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,27),';')                                        MARKETING_ATTR26,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,28),';')                                        MARKETING_ATTR27,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,29),';')                                        MARKETING_ATTR28,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,30),';')                                        MARKETING_ATTR29,
       RTRIM (REGEXP_SUBSTR(RTRIM(SUBSTR(x.TEXT_LINE,76)),'[^;"]*;',1,31),';')                                        MARKETING_ATTR30,
       (x.ROW_NUMBER)                                                                                                 ROW_NUMBER,
       FILE_NAME                                                                                                      FILE_NAME,
       CAST('1.00.50' AS VARCHAR2(20 char))                                                                       VERSION_NUMBER,
       wbx_parm.get_num ('RIS3KAPAUD')                                                                                    AUD_ID
FROM   RIS_STG.FLH_KAP_POS_REC x
WHERE  x.RECORD_TYPE = 'D'
AND    CASE x.RECORD_TYPE WHEN 'D' THEN SUBSTR(x.TEXT_LINE,5,1) END = 'B'
AND    SUBSTR(x.TEXT_LINE,INSTR(x.TEXT_LINE,';',1,1),INSTR(x.TEXT_LINE,';',1,31)) is not null
AND    rownum <= ris3_test_flow('PF_RIS3_FILES_KAP');
