-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

DROP TABLE IF EXISTS "public"."geo_dim";



-- ************************************** "public"."geo_dim"

CREATE TABLE IF NOT EXISTS "public"."geo_dim"
(
 "geo_id"      serial NOT NULL,
 "country"     varchar(100) NOT NULL,
 "region"      varchar(100) NOT NULL,
 "state"       varchar(100) NOT NULL,
 "city"        varchar(100) NOT NULL,
 "postal_code" varchar(20) NULL,
 CONSTRAINT "PK_geo_dim" PRIMARY KEY ( "geo_id" )
);