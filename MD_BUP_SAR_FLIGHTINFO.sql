---------------------------
--New TABLE
--MD_BUP_SAR_FLIGHTINFO
---------------------------
  CREATE TABLE "RPT_VIEW_USER_RIS"."MD_BUP_SAR_FLIGHTINFO" 
   (	"BUP_CODE_SELLER" VARCHAR2(3 CHAR),
	"BUP_SUBCODE_SELLER" VARCHAR2(1 CHAR),
	"FILE_NAME" VARCHAR2(100 CHAR),
	"SALE_DATE" DATE,
	"CHECK_DATE" DATE,
	"ARRIVAL_DEPARTURE" VARCHAR2(1 CHAR),
	"NR_PREFIX" NUMBER,
	"NR_SUFFIX" NUMBER,
	"NR_FLIGHT_DEST" NUMBER,
	"NR_PAX_DEST" NUMBER,
	"NR_NO_PREFIX" NUMBER,
	"NR_NO_SUFFIX" NUMBER,
	"NR_NO_FLIGHT_DEST" NUMBER,
	"NR_NO_PAX_DEST" NUMBER,
	"NR_INVALID_FLIGHT_DEST" NUMBER,
	"NR_INVALID_PAX_DEST" NUMBER,
	"ID" NUMBER,
	"DATE_CREATED" DATE,
	"DATE_UPDATED" DATE,
	"DATE_DELETED" DATE,
	"AUD_ID_CREATED" NUMBER,
	"AUD_ID_UPDATED" NUMBER,
	"AUD_ID_DELETED" NUMBER,
	"CURR_ID" VARCHAR2(1 CHAR)
   );
  COMMENT ON TABLE "RPT_VIEW_USER_RIS"."MD_BUP_SAR_FLIGHTINFO" IS 'Version 2019-41';
