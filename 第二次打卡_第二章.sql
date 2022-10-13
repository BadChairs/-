-- 通过使用括号让OR运算符先于AND运算符执行
SELECT product_name, product_type, regist_date
  FROM product
 WHERE product_type = '办公用品'
   AND ( regist_date = '2009-09-11'
        OR regist_date = '2009-09-20');

# 第二章：基础查询与排序
# 2.1 编写一条SQL语句，从 product(商品) 表中选取出“登记日期(regist_date)在2009年4月28日之后”的商品，查询结果要包含 product name 和 regist_date 两列。
SELECT product_name, regist_date
    FROM product
    WHERE regist_date >=  '2009-04-28';
# 2.2 说出返回结果
/*  1、从product表返回所有purchase_price为空的列
    2、从product表返回所有purchase_price不为空的列
    3、从product表返回所有product_name大于空的列
 */
# 2.3 请写出两条可以得到相同结果的SELECT语句:能够从 product 表中取出“销售单价（sale_price）比进货单价（purchase_price）高出500日元以上”的商品。
select product_name, sale_price, purchase_price
    from product
    where sale_price-purchase_price >= 500;

select product_name, sale_price, purchase_price
    from product
    where sale_price >= product.purchase_price+500;
# 2.4 请写出一条SELECT语句，从 product 表中选取出满足“销售单价打九折之后利润高于 100 日元的办公用品和厨房用具”条件的记录。查询结果要包括 product_name列、product_type 列以及销售单价打九折之后的利润（别名设定为 profit）。
select product_name, product_type,sale_price*0.9-purchase_price as profit
    from product
    where sale_price*0.9-purchase_price > 100
    and (product_name = '办公用品' or '厨房用具');

#2.5
#(1)sum(product_name)错误，sum适用于数值类型的列
#(2)先写where子句，再写group by 子句
#(3) SELECT子句只能写聚合键及聚合函数，不对应

#2.6
select product_type, sum(sale_price) sale_sum, sum(purchase_price) purchase_sum
from product
GROUP BY product_type
HAVING sale_sum > purchase_sum*1.5;


#2.7
order by regist_date desc, sale_price;
