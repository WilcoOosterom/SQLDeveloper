---------------------------
--New TABLE
--FLH_GER_POS_XT
---------------------------
  CREATE TABLE "RPT_VIEW_USER_RIS"."FLH_GER_POS_XT" 
   (	"RECORD_TYPE" VARCHAR2(1 CHAR),
	"TEXT_LINE" VARCHAR2(4000 CHAR)
   ) ORGANIZATION EXTERNAL
  ( TYPE ORACLE_LOADER
    DEFAULT DIRECTORY "RIS3_GER_PROCESSING"
    ACCESS PARAMETERS 
    ( RECORDS DELIMITED BY NEWLINE
              CHARACTERSET WE8MSWIN1252
              STRING SIZES ARE IN BYTES
              NOBADFILE
              NODISCARDFILE
              NOLOGFILE
              FIELDS
                NOTRIM
                MISSING FIELD VALUES ARE NULL
                (
                  "RECORD_TYPE" POSITION (1:1) CHAR (1),
                  "TEXT_LINE" POSITION (2:1000) CHAR (999)
                )
                                             ) 
    LOCATION 
    ( "RIS3_GER_PROCESSING":'POS.dat'
    ) 
  ) 
  REJECT LIMIT UNLIMITED;
