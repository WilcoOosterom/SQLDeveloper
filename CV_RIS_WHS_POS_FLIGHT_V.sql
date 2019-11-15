---------------------------
--New VIEW
--CV_RIS_WHS_POS_FLIGHT_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."CV_RIS_WHS_POS_FLIGHT_V" 
 ( "BUP_CODE_SELLER", "BUP_SUBCODE_SELLER", "SHOP", "POS", "RECEIPT", "SALE_DATE", "SALE_TIME", "PREFIX", "SUFFIX", "DESTINATION_IATA", "FINAL_DESTINATION_IATA", "GATE_CODE", "PASSENGER_CLASS", "EU_NEU_CODE", "ARRIVAL_DEPARTURE", "ROW_NUMBER", "FILE_NAME", "DATE_CREATED", "VERSION_NUMBER"
  )  AS 
  SELECT
/*------------------------------------------------------------------
*  CV_RIS_WHS_POS_FLIGHT_V
*  Generated on: 08-11-2019
*  Version     : 2019-47
*  Developer   : Wilco Oosterom
*  
*  Purpose     : Migrating historical data up to 2016 from RIS
* 
*/------------------------------------------------------------------
       CONS_CODE             BUP_CODE_SELLER
,      CONS_SUBNR            BUP_SUBCODE_SELLER
,      SHOP                  SHOP
,      KASSA                 POS
,      BON                   RECEIPT
,      VERKOOPDATUM          SALE_DATE
,      VERKOOPTIJD           SALE_TIME
,      CAST (CASE WHEN PREFIX ='|||' then null else prefix end as varchar2(3 char))                           PREFIX
,      CAST (CASE WHEN SUFFIX ='9999' then null else suffix end as varchar2(5 char))                          SUFFIX
,      CAST (CASE WHEN BESTEMMING_IATA ='|||' then null else BESTEMMING_IATA end as varchar2(3 char))         DESTINATION_IATA
,      CAST (CASE WHEN EINDBESTEMMING_IATA ='|||' then null else EINDBESTEMMING_IATA end as varchar2(3 char)) FINAL_DESTINATION_IATA
,      CAST (CASE WHEN GATE_CODE ='|||' then null else GATE_CODE end as varchar2(3 char))                     GATE_CODE
,      CAST (CASE WHEN PASSAGIER_KLASSE ='|||||' then null else PASSAGIER_KLASSE end as varchar2(5 char))     PASSENGER_CLASS
,      CAST (CASE WHEN EU_NEU_CODE ='|||' then null else EU_NEU_CODE end as varchar2(3 char))                 EU_NEU_CODE
,      CAST (CASE WHEN AANK_VERTR_CODE ='|' then null else AANK_VERTR_CODE end as varchar2(1 char))           ARRIVAL_DEPARTURE
,      ROW_NUMBER() OVER (PARTITION BY TRUNC(DATE_CREATED) ORDER BY SHOP, KASSA, BON)  ROW_NUMBER
,      CONS_CODE||'1POS'||TO_CHAR(DATE_CREATED,'YYYYMMDD')||'.conv'   FILE_NAME
,      TRUNC(COALESCE(DATE_CREATED, DATE_CHANGED))  DATE_CREATED
,      VERSION_NUMBER
FROM RIS.ODS_POS_VLUCHT
WHERE CONS_CODE NOT IN ('!','?')
AND CONS_CODE = 'WHS'
AND TO_CHAR(DATE_CREATED,'YYYY') <= '2016'
ORDER BY DATE_CREATED
;
