-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;

DROP TABLE IF EXISTS "public"."calendar_dim";



-- ************************************** "public"."calendar_dim"

CREATE TABLE IF NOT EXISTS "public"."calendar_dim"
(
 "date_id"  serial NOT NULL,
 "year"     int NOT NULL,
 "quarter"  int NOT NULL,
 "month"    int NOT NULL,
 "week"     int NOT NULL,
 "week_day" varchar(20) NOT NULL,
 "date"     date NOT NULL,
 "leap"     varchar(20) NOT NULL,
 CONSTRAINT "PK_calendar_dim" PRIMARY KEY ( "date_id" )
);