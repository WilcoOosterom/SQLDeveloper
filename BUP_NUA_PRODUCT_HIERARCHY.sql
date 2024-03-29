---------------------------
--New TABLE
--BUP_NUA_PRODUCT_HIERARCHY
---------------------------
  CREATE TABLE "RPT_VIEW_USER_RIS"."BUP_NUA_PRODUCT_HIERARCHY" 
   (	"BUP_CODE_OWNER" VARCHAR2(3),
	"BUP_SUBCODE_OWNER" NUMBER(1,0),
	"ARTICLE_CATEGORY" VARCHAR2(20),
	"ARTICLE_CATEGORY_DESC" VARCHAR2(50),
	"MAIN_ARTICLE_CATEGORY" VARCHAR2(20),
	"MAIN_ARTICLE_CATEGORY_DESC" VARCHAR2(50),
	"ROW_NUMBER" NUMBER,
	"FILE_NAME" VARCHAR2(20),
	"VERSION_NUMBER" VARCHAR2(10),
	"ID" NUMBER,
	"DATE_CREATED" DATE,
	"DATE_UPDATED" DATE,
	"DATE_DELETED" DATE,
	"AUD_ID_CREATED" NUMBER,
	"AUD_ID_UPDATED" NUMBER,
	"AUD_ID_DELETED" NUMBER,
	"CURR_ID" CHAR(1)
   );
