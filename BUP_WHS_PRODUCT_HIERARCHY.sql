---------------------------
--New TABLE
--BUP_WHS_PRODUCT_HIERARCHY
---------------------------
  CREATE TABLE "RPT_VIEW_USER_RIS"."BUP_WHS_PRODUCT_HIERARCHY" 
   (	"BUP_CODE_OWNER" VARCHAR2(3 CHAR),
	"BUP_SUBCODE_OWNER" VARCHAR2(1 CHAR),
	"ARTICLE_CATEGORY" VARCHAR2(20 CHAR),
	"ARTICLE_CATEGORY_DESC" VARCHAR2(50 CHAR),
	"MAIN_ARTICLE_CATEGORY" VARCHAR2(20 CHAR),
	"MAIN_ARTICLE_CATEGORY_DESC" VARCHAR2(50 CHAR),
	"ROW_NUMBER" NUMBER,
	"FILE_NAME" VARCHAR2(111 CHAR),
	"VERSION_NUMBER" VARCHAR2(20 CHAR),
	"AUD_ID" NUMBER,
	"ID" NUMBER,
	"DATE_CREATED" DATE,
	"DATE_UPDATED" DATE,
	"DATE_DELETED" DATE,
	"AUD_ID_CREATED" NUMBER,
	"AUD_ID_UPDATED" NUMBER,
	"AUD_ID_DELETED" NUMBER,
	"CURR_ID" VARCHAR2(1 CHAR)
   );
  COMMENT ON TABLE "RPT_VIEW_USER_RIS"."BUP_WHS_PRODUCT_HIERARCHY" IS 'Version 1.00.50';
