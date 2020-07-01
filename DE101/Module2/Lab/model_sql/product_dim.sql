-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

DROP TABLE IF EXISTS "public"."product_dim";



-- ************************************** "public"."product_dim"

CREATE TABLE IF NOT EXISTS "public"."product_dim"
(
 "prod_id"      serial NOT NULL,
 "product_id"   varchar(50) NOT NULL,
 "product_name" varchar(500) NOT NULL,
 "category"     varchar(50) NOT NULL,
 "sub_category" varchar(50) NOT NULL,
 "segment"      varchar(50) NOT NULL,
 CONSTRAINT "PK_product_dim" PRIMARY KEY ( "prod_id" )
);