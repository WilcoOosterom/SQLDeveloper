---------------------------
--New TABLE
--MD_RIS3_COLUMN_NAMES
---------------------------
  CREATE TABLE "RPT_VIEW_USER_RIS"."MD_RIS3_COLUMN_NAMES" 
   (	"POS_FILE" VARCHAR2(3 CHAR),
	"ART_FILE" VARCHAR2(3 CHAR),
	"PRH_FILE" VARCHAR2(3 CHAR),
	"COLUMN_NAME" VARCHAR2(128 CHAR) NOT NULL ENABLE,
	"DATA_TYPE" VARCHAR2(64 CHAR) NOT NULL ENABLE,
	"DATA_LENGTH" NUMBER,
	"DATE_DEFINED" DATE DEFAULT SYSDATE
   );
