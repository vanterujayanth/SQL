use bikeStore
select * from sales.customers;
select * from production.products;
select * from sales.order_items
select * from sales.orders
select * from sales.staffs
select * from sales.stores
select * from production.brands
select * from production.categories
select * from production.stocks
-- waq to get product details from the table which product cost is the first highestin the table
select * from production.products
where list_price =(select max(list_price) from production.products);
select * from sales.orders
where  customer_id =(select MAX(customer_id ) from sales.orders)
;
select customer_id,first_name from sales.customers
where customer_id in (select customer_id from sales.orders)
where ;
--
SELECT  first_name, order_id,order_date,  
(SELECT MAX (list_price) FROM sales.order_items as i
WHERE i.order_id = o.order_id) AS max_list_price
FROM sales.orders  as o,sales.customers
order by order_id desc; 
--
select * from sales.orders
where customer_id in (select customer_id from sales.customers
where city = 'Orchard Park')
order  by  order_date ;
-- waq to get the details of the customer who ordered the item
select * from sales.customers
where customer_id in (select  customer_id from sales.orders
where order_id in (select order_id from sales.order_items
where quantity =2))
--
--select product_id,list_price from sales.order_items
--where product_id ; 
select product_name,brand_id,category_id from production.products
where brand_id in (
select brand_id from production.brands 
where brand_name ='Pure Cycles' or brand_name ='Strider');



select cu.first_name,brand_name,product_name as price from production.brands as b
inner join production.products as p
on b.brand_id = p.brand_id
inner join production.categories as c
on c.category_id=p.category_id
inner join production.stocks  as s
on p.product_id= s.product_id
inner join sales.order_items as item
on p.product_id = item.product_id
inner join sales.stores as store
on store.store_id= s.store_id
inner join sales.orders as o
on o.store_id = store.store_id
inner join sales.staffs as staff
on staff.staff_id = o.staff_id
and 
staff.store_id = store.store_id
inner join sales.customers as cu
on cu.customer_id= o.customer_id


