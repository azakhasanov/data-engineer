-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

DROP TABLE IF EXISTS "public"."shipping_dim";



-- ************************************** "public"."shipping_dim"

CREATE TABLE IF NOT EXISTS "public"."shipping_dim"
(
 "ship_id"       serial NOT NULL,
 "shipping_mode" varchar(50) NOT NULL,
 CONSTRAINT "PK_shipping_dim" PRIMARY KEY ( "ship_id" )
);