#3.1
create view ViewPractice5_1
AS
select product_name, sale_price, regist_date
from product
where sale_price >=1000
and regist_date = '2009-09-20';

#3.2
#会报错；视图插入数据，实际上是给原表插入数据，原表要求product_id, product_name, product_type不为空。

#3.3
select product_id, product_name, product_type,sale_price,
(select avg(sale_price) from product) as sale_price_all
from product
order by product_id;

# 3.4
create view AvgPriceByType
as
select product_id, product_name, product_type,sale_price,
(select avg(sale_price) from product group by product_type) as avg_sale_price
from product
order by product_id;

#3.5
#不会

#3.6
#(1)找出价格不是500,2800,5000的商品的名称及价格
#(2)取空，not in谓词参数不可以有null，否则查询结果为空

#3.7
select
	count(case when sale_price <=1000 then sale_price else null end) as low_price,
	count(case when sale_price between 1001 and 3000 then sale_price else null end) as mid_price,
	count(case when sale_price > 3001 then sale_price else null end) as high_price
from product;
