-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

DROP TABLE IF EXISTS "public"."sales_fact";



-- ************************************** "public"."sales_fact"

CREATE TABLE IF NOT EXISTS "public"."sales_fact"
(
 "sales_id"      serial NOT NULL,
 "cust_id"       integer NOT NULL,
 "order_date_id" integer NOT NULL,
 "ship_date_id"  integer NOT NULL,
 "prod_id"       integer NOT NULL,
 "ship_id"       integer NOT NULL,
 "geo_id"        integer NOT NULL,
 "order_id"      varchar(50) NOT NULL,
 "sales"         numeric(9,4) NOT NULL,
 "profit"        numeric(21,16) NOT NULL,
 "quantity"      int NOT NULL,
 "discount"      numeric(4,2) NOT NULL,
 CONSTRAINT "PK_sales_fact" PRIMARY KEY ( "sales_id" )
);