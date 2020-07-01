--SHIPPING
--deleting rows
truncate table public.shipping_dim;

--generating ship_id and inserting ship_mode from orders
insert into public.shipping_dim 
select 100+row_number() over(), ship_mode from (select distinct ship_mode from public.orders) a;
--checking
select * from public.shipping_dim sd; 


--CUSTOMER
--deleting rows
truncate table public.customer_dim;
--inserting
insert into public.customer_dim 
select 100+row_number() over(), customer_id, customer_name from (select distinct customer_id, customer_name from public.orders) a;
--checking
select * from public.customer_dim cd;  


--GEOGRAPHY
--deleting rows
truncate table public.geo_dim;
--generating geo_id and inserting rows from orders
insert into public.geo_dim 
select 100+row_number() over(), country, region, state, city, postal_code from (select distinct country, region, state, city, postal_code from public.orders) a;
--data quality check
select * from public.geo_dim;


--PRODUCT
--deleting rows
truncate table public.product_dim ;
--
insert into public.product_dim 
select 100+row_number() over () as prod_id ,product_id, product_name, category, subcategory, segment from (select distinct product_id, product_name, category, subcategory, segment from public.orders ) a;
--checking
select * from public.product_dim cd; 


--CALENDAR use function instead 
-- example https://tapoueh.org/blog/2017/06/postgresql-and-the-calendar/
--deleting rows
truncate table public.calendar_dim;
--
insert into public.calendar_dim 
select 
to_char(date,'yyyymmdd')::int as date_id,  
       extract('year' from date)::int as year,
       extract('quarter' from date)::int as quarter,
       extract('month' from date)::int as month,
       extract('week' from date)::int as week,
       to_char(date, 'dy') as week_day,
       date::date,
       extract('day' from
               (date + interval '2 month - 1 day')
              ) = 29
       as leap
  from generate_series(date '2000-01-01',
                       date '2030-01-01',
                       interval '1 day')
       as t(date);
--checking
select * from public.calendar_dim; 


--METRICS
insert into public.sales_fact 
select
	 100+row_number() over() as sales_id
	 ,cust_id
	 ,to_char(order_date,'yyyymmdd')::int as  order_date_id
	 ,to_char(ship_date,'yyyymmdd')::int as  ship_date_id
	 ,p.prod_id
	 ,s.ship_id
	 ,geo_id
	 ,o.order_id
	 ,sales
	 ,profit
     ,quantity
	 ,discount
from public.orders o 
inner join public.shipping_dim s on o.ship_mode = s.shipping_mode
inner join public.geo_dim g on o.postal_code = g.postal_code and g.country=o.country and g.city = o.city and o.state = g.state --City Burlington doesn't have postal code
inner join public.product_dim p on o.product_name = p.product_name and o.segment=p.segment and o.subcategory=p.sub_category and o.category=p.category and o.product_id=p.product_id 
inner join public.customer_dim cd on cd.customer_id=o.customer_id and cd.customer_name=o.customer_name ;


--do you get 9994rows?
select count(*) from public.sales_fact sf
inner join public.shipping_dim s on sf.ship_id=s.ship_id
inner join public.geo_dim g on sf.geo_id=g.geo_id
inner join public.product_dim p on sf.prod_id=p.prod_id
inner join public.customer_dim cd on sf.cust_id=cd.cust_id;