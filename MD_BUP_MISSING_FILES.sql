---------------------------
--New TABLE
--MD_BUP_MISSING_FILES
---------------------------
  CREATE TABLE "RPT_VIEW_USER_RIS"."MD_BUP_MISSING_FILES" 
   (	"BUSINESS_PARTNER" VARCHAR2(3 CHAR) NOT NULL ENABLE,
	"FILE_ID" VARCHAR2(8 CHAR) NOT NULL ENABLE,
	"DATE_CREATED" DATE NOT NULL ENABLE,
	"DATE_UPDATED" DATE,
	"DATE_DELETED" DATE,
	"CURR_ID" VARCHAR2(1 CHAR) NOT NULL ENABLE
   );
