---------------------------
--New TABLE
--FLH_SAR_POS_REC
---------------------------
  CREATE TABLE "RPT_VIEW_USER_RIS"."FLH_SAR_POS_REC" 
   (	"RECORD_TYPE" VARCHAR2(1 CHAR),
	"TEXT_LINE" VARCHAR2(4000 CHAR),
	"ROW_NUMBER" NUMBER,
	"FILE_NAME" VARCHAR2(111 CHAR),
	"ID" NUMBER,
	"DATE_CREATED" DATE,
	"DATE_UPDATED" DATE,
	"DATE_DELETED" DATE,
	"AUD_ID_CREATED" NUMBER,
	"AUD_ID_UPDATED" NUMBER,
	"AUD_ID_DELETED" NUMBER,
	"CURR_ID" VARCHAR2(1 CHAR)
   );
  COMMENT ON TABLE "RPT_VIEW_USER_RIS"."FLH_SAR_POS_REC" IS 'Version 1.00.50';
