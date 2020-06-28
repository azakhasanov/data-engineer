--Динамика дохода и прибыли
select 
case when year_ is null then 'Общий итог' 
else year_ end as year_,
case when month_ is null and year_ is not null 
then 'Итог за ' || year_ else month_ end as month_,
sales,
profit
from (
select 
to_char(o.order_date, 'yyyy') as year_,
to_char(o.order_date, 'mm') as month_,
round(sum(sales)) as sales,
round(sum(profit)) as profit
from orders o
group by rollup(1, 2)
order by 1, 2) s;

--Категории товаров(сравнение)
select 
case when category is null then 'Общий итог' 
else category end as category,
case when subcategory is null and category is not null 
then 'Итог по ' || category else subcategory end as subcategory,
sales,
profit
from (
select 
category,
subcategory,
round(sum(sales)) as sales,
round(sum(profit)) as profit
from orders o
group by rollup(1, 2)
order by 3) s;

--Региональные менеджеры(сравнение)
select case when person is null then 'Общий итог' 
else person end as person,
sales,
profit from (
select 
p.person,
round(sum(sales)) as sales,
round(sum(profit)) as profit
from orders o join people p using (region)
group by rollup(1)
order by 2) s;

--Сегменты(сравнение)
select case when segment is null then 'Общий итог' 
else segment end as segment,
sales,
profit from (
select 
segment,
round(sum(sales)) as sales,
round(sum(profit)) as profit
from orders o
group by rollup(1)
order by 2) s;

--Динамика по сегментам
SELECT * FROM 
crosstab(
$$select
to_char(o.order_date, 'yyyymm') as yearmm,
segment,
round(sum(sales)) as sales
from orders o
group by (1, 2)
order by 1;$$
) AS ct(yearmm text, "Consumer" numeric,"Corporate" numeric,"Home Office" numeric)
ORDER BY yearmm;

--Основные показатели
--По штатам
--По регионам(сравнение)
--По возвратам в %