---------------------------
--New TABLE
--MD_BUP_CAP_FILE
---------------------------
  CREATE TABLE "RPT_VIEW_USER_RIS"."MD_BUP_CAP_FILE" 
   (	"BUSINESS_PARTNER" VARCHAR2(3 CHAR),
	"FILE_NAME" VARCHAR2(100 CHAR),
	"FILETYPE" VARCHAR2(20 CHAR),
	"PROCESSDATE" DATE,
	"ROW_FROM" NUMBER,
	"ROW_TO" NUMBER,
	"ROW_READ_CALC" NUMBER,
	"ROW_DELIVERY" NUMBER,
	"ROW_READ_ACTUAL" NUMBER,
	"FILE_CONSISTENT" VARCHAR2(1 CHAR),
	"FILE_COMPLETE" VARCHAR2(1 CHAR),
	"VERSION_NUMBER" VARCHAR2(20 CHAR),
	"ID" NUMBER,
	"DATE_CREATED" DATE,
	"DATE_UPDATED" DATE,
	"DATE_DELETED" DATE,
	"AUD_ID_CREATED" NUMBER,
	"AUD_ID_UPDATED" NUMBER,
	"AUD_ID_DELETED" NUMBER,
	"CURR_ID" VARCHAR2(1 CHAR)
   );
  COMMENT ON TABLE "RPT_VIEW_USER_RIS"."MD_BUP_CAP_FILE" IS 'Version 2019-41';
