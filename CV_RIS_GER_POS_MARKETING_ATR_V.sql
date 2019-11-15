---------------------------
--New VIEW
--CV_RIS_GER_POS_MARKETING_ATR_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."CV_RIS_GER_POS_MARKETING_ATR_V" 
 ( "BUP_CODE_SELLER", "BUP_SUBCODE_SELLER", "MARKETING_ATTR_KEY", "MARKETING_ATTR1", "MARKETING_ATTR2", "MARKETING_ATTR3", "MARKETING_ATTR4", "MARKETING_ATTR5", "MARKETING_ATTR6", "MARKETING_ATTR7", "MARKETING_ATTR8", "MARKETING_ATTR9", "MARKETING_ATTR10", "MARKETING_ATTR11", "MARKETING_ATTR12", "MARKETING_ATTR13", "MARKETING_ATTR14", "MARKETING_ATTR15", "MARKETING_ATTR16", "MARKETING_ATTR17", "MARKETING_ATTR18", "MARKETING_ATTR19", "MARKETING_ATTR20", "MARKETING_ATTR21", "MARKETING_ATTR22", "MARKETING_ATTR23", "MARKETING_ATTR24", "MARKETING_ATTR25", "MARKETING_ATTR26", "MARKETING_ATTR27", "MARKETING_ATTR28", "MARKETING_ATTR29", "MARKETING_ATTR30", "ROW_NUMBER", "FILE_NAME", "DATE_CREATED", "VERSION_NUMBER"
  )  AS 
  SELECT
/*------------------------------------------------------------------
*  CV_RIS_GER_POS_MARKETING_ATTR
*  Generated on: 08-11-2019
*  Version     : 2019-47
*  Developer   : Wilco Oosterom
*
*  Purpose     : Migrating historical data up to 2016 from RIS
*
*/------------------------------------------------------------------
       BUP_CODE_SELLER
,      BUP_SUBCODE_SELLER
,      MARKETING_ATTR_KEY
,      MARKETING_ATTR1
,      MARKETING_ATTR2
,      MARKETING_ATTR3
,      MARKETING_ATTR4
,      MARKETING_ATTR5
,      MARKETING_ATTR6
,      MARKETING_ATTR7
,      MARKETING_ATTR8
,      MARKETING_ATTR9
,      MARKETING_ATTR10
,      MARKETING_ATTR11
,      MARKETING_ATTR12
,      MARKETING_ATTR13
,      MARKETING_ATTR14
,      MARKETING_ATTR15
,      MARKETING_ATTR16
,      MARKETING_ATTR17
,      MARKETING_ATTR18
,      MARKETING_ATTR19
,      MARKETING_ATTR20
,      MARKETING_ATTR21
,      MARKETING_ATTR22
,      MARKETING_ATTR23
,      MARKETING_ATTR24
,      MARKETING_ATTR25
,      MARKETING_ATTR26
,      MARKETING_ATTR27
,      MARKETING_ATTR28
,      MARKETING_ATTR29
,      MARKETING_ATTR30
,      ROW_NUMBER() OVER (PARTITION BY TRUNC(DATE_CREATED) ORDER BY BUP_CODE_SELLER, BUP_SUBCODE_SELLER)  ROW_NUMBER
,      FILE_NAME
,      DATE_CREATED
,      VERSION_NUMBER
FROM (
     SELECT DISTINCT CONS_CODE             BUP_CODE_SELLER
     ,      CONS_SUBNR            BUP_SUBCODE_SELLER
     ,      MKT.MARKETING_ATTR_KEY    MARKETING_ATTR_KEY
     ,      MARKETING_ATTR1
     ,      MARKETING_ATTR2
     ,      MARKETING_ATTR3
     ,      MARKETING_ATTR4
     ,      MARKETING_ATTR5
     ,      MARKETING_ATTR6
     ,      MARKETING_ATTR7
     ,      MARKETING_ATTR8
     ,      MARKETING_ATTR9
     ,      MARKETING_ATTR10
     ,      MARKETING_ATTR11
     ,      MARKETING_ATTR12
     ,      MARKETING_ATTR13
     ,      MARKETING_ATTR14
     ,      MARKETING_ATTR15
     ,      MARKETING_ATTR16
     ,      MARKETING_ATTR17
     ,      MARKETING_ATTR18
     ,      MARKETING_ATTR19
     ,      MARKETING_ATTR20
     ,      MARKETING_ATTR21
     ,      MARKETING_ATTR22
     ,      MARKETING_ATTR23
     ,      MARKETING_ATTR24
     ,      MARKETING_ATTR25
     ,      MARKETING_ATTR26
     ,      MARKETING_ATTR27
     ,      MARKETING_ATTR28
     ,      MARKETING_ATTR29
     ,      MARKETING_ATTR30
     ,      CONS_CODE||'1POS'||TO_CHAR(MKT.DATE_CREATED,'YYYYMMDD')||'.conv'   FILE_NAME
     ,      TRUNC(COALESCE(MKT.DATE_CREATED, MKT.DATE_CHANGED))  DATE_CREATED
     ,      VERSION_NUMBER
     FROM RIS.ODS_POS_BETALING OPB
     LEFT OUTER JOIN RIS.ODS_MARKETING_ATTR MKT
     ON MKT.ID = OPB.MAT_ID_FK18
     WHERE CONS_CODE NOT IN ('!','?')
     AND CONS_CODE = 'GER'
     AND TO_CHAR(MKT.DATE_CREATED,'YYYY') <= '2016')
ORDER BY DATE_CREATED;