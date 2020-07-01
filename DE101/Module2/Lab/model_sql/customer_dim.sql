-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

DROP TABLE IF EXISTS "public"."customer_dim";



-- ************************************** "public"."customer_dim"

CREATE TABLE IF NOT EXISTS "public"."customer_dim"
(
 "cust_id"       serial NOT NULL,
 "customer_id"   varchar(50) NOT NULL,
 "customer_name" varchar(500) NOT NULL,
 CONSTRAINT "PK_customer" PRIMARY KEY ( "cust_id" )
);