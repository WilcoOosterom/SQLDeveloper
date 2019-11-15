---------------------------
--New TABLE
--BUP_ARA_POS_LINE_ITEM
---------------------------
  CREATE TABLE "RPT_VIEW_USER_RIS"."BUP_ARA_POS_LINE_ITEM" 
   (	"BUP_CODE_SELLER" VARCHAR2(3),
	"BUP_SUBCODE_SELLER" NUMBER(1,0),
	"BUP_CODE_OWNER" VARCHAR2(3),
	"ARTICLE_CODE" VARCHAR2(20),
	"NUMBER_OF_ARTICLES" NUMBER(6,0),
	"ITEM_PRICE" NUMBER(10,2),
	"GROSS_AMOUNT" NUMBER(10,2),
	"TAX" NUMBER(10,2),
	"DISCOUNT_AMOUNT" NUMBER(10,2),
	"NET_AMOUNT" NUMBER(10,2),
	"SALE_CODE" NUMBER(1,0),
	"SHOP" VARCHAR2(10),
	"POS" VARCHAR2(10),
	"RECEIPT" VARCHAR2(20),
	"SALE_DATE" DATE,
	"SALE_TIME" NUMBER(4,0),
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