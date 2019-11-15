---------------------------
--New TABLE
--BUP_ARA_POS_PAYMENT
---------------------------
  CREATE TABLE "RPT_VIEW_USER_RIS"."BUP_ARA_POS_PAYMENT" 
   (	"BUP_CODE_SELLER" VARCHAR2(3),
	"BUP_SUBCODE_SELLER" NUMBER(1,0),
	"TOTAL_RECEIPT_AMOUNT" NUMBER(12,2),
	"PAYMENT_TYPE" NUMBER(1,0),
	"PAYMENT_CODE" NUMBER(3,0),
	"SHOP" VARCHAR2(10),
	"POS" VARCHAR2(10),
	"RECEIPT" VARCHAR2(20),
	"SALE_DATE" DATE,
	"SALE_TIME" NUMBER(4,0),
	"NATIONALITY" VARCHAR2(4),
	"BOARDINGPASS_NR" VARCHAR2(40),
	"VOUCHER_AMOUNT" NUMBER,
	"MARKETING_ATTR_KEY" VARCHAR2(3918),
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
