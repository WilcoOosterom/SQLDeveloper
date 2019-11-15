---------------------------
--New TABLE
--BUP_KAP_POS_LINE_ITEM
---------------------------
  CREATE TABLE "RPT_VIEW_USER_RIS"."BUP_KAP_POS_LINE_ITEM" 
   (	"BUP_CODE_SELLER" VARCHAR2(3 CHAR),
	"BUP_SUBCODE_SELLER" VARCHAR2(1 CHAR),
	"BUP_CODE_OWNER" VARCHAR2(3 CHAR),
	"ARTICLE_CODE" VARCHAR2(20 CHAR),
	"NUMBER_OF_ARTICLES" NUMBER,
	"ITEM_PRICE" NUMBER,
	"GROSS_AMOUNT" NUMBER,
	"TAX" NUMBER,
	"DISCOUNT_AMOUNT" NUMBER,
	"NET_AMOUNT" NUMBER,
	"SALE_CODE" NUMBER,
	"SHOP" VARCHAR2(10 CHAR),
	"POS" VARCHAR2(10 CHAR),
	"RECEIPT" VARCHAR2(20 CHAR),
	"SALE_DATE" DATE,
	"SALE_TIME" NUMBER,
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
  COMMENT ON TABLE "RPT_VIEW_USER_RIS"."BUP_KAP_POS_LINE_ITEM" IS 'Version 1.00.50';
