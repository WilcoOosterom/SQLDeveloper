---------------------------
--New TABLE
--FLH_WOD_METADATA
---------------------------
  CREATE TABLE "RPT_VIEW_USER_RIS"."FLH_WOD_METADATA" 
   (	"FILETYPE" VARCHAR2(20 CHAR),
	"RECORD_TYPE" VARCHAR2(1 CHAR),
	"TEXT_LINE" VARCHAR2(4000 CHAR),
	"ROW_NUMBER" NUMBER,
	"FILE_NAME" VARCHAR2(111 CHAR),
	"PROCESSDATE" DATE,
	"ID" NUMBER,
	"DATE_CREATED" DATE,
	"DATE_UPDATED" DATE,
	"DATE_DELETED" DATE,
	"AUD_ID_CREATED" NUMBER,
	"AUD_ID_UPDATED" NUMBER,
	"AUD_ID_DELETED" NUMBER,
	"CURR_ID" CHAR(1 CHAR)
   );
