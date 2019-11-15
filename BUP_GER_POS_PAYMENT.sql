---------------------------
--New TABLE
--BUP_GER_POS_PAYMENT
---------------------------
  CREATE TABLE "RPT_VIEW_USER_RIS"."BUP_GER_POS_PAYMENT" 
   (	"BUP_CODE_SELLER" VARCHAR2(3 CHAR),
	"BUP_SUBCODE_SELLER" VARCHAR2(1 CHAR),
	"TOTAL_RECEIPT_AMOUNT" NUMBER,
	"PAYMENT_TYPE" NUMBER,
	"PAYMENT_CODE" NUMBER,
	"SHOP" VARCHAR2(10 CHAR),
	"POS" VARCHAR2(10 CHAR),
	"RECEIPT" VARCHAR2(20 CHAR),
	"SALE_DATE" DATE,
	"SALE_TIME" NUMBER,
	"NATIONALITY" VARCHAR2(4 CHAR),
	"BOARDINGPASS_NR" VARCHAR2(40 CHAR),
	"VOUCHER_AMOUNT" NUMBER,
	"MARKETING_ATTR_KEY" VARCHAR2(4000 CHAR),
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
  COMMENT ON TABLE "RPT_VIEW_USER_RIS"."BUP_GER_POS_PAYMENT" IS 'Version 1.00.50';
