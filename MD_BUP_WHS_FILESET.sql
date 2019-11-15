---------------------------
--New TABLE
--MD_BUP_WHS_FILESET
---------------------------
  CREATE TABLE "RPT_VIEW_USER_RIS"."MD_BUP_WHS_FILESET" 
   (	"BUSINESS_PARTNER" VARCHAR2(3 CHAR),
	"FILE_NAME_MASK" VARCHAR2(100 CHAR),
	"FILE_DATE" DATE,
	"CHECK_DATE" DATE,
	"LOAD_RESULT" VARCHAR2(32 CHAR),
	"ID" NUMBER,
	"DATE_CREATED" DATE,
	"DATE_UPDATED" DATE,
	"DATE_DELETED" DATE,
	"AUD_ID_CREATED" NUMBER,
	"AUD_ID_UPDATED" NUMBER,
	"AUD_ID_DELETED" NUMBER,
	"CURR_ID" VARCHAR2(1 CHAR)
   );
  COMMENT ON TABLE "RPT_VIEW_USER_RIS"."MD_BUP_WHS_FILESET" IS 'Version 2019-41';
