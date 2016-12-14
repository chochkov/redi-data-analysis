-- -h localhost -d redi

drop table if exists orders;
create table orders (order_date date, product_id text, market text);

insert into orders (
  values
('2016-01-01', 'A', 'de'),
('2016-01-01', 'A', 'de'),
('2016-01-01', 'A', 'uk'),
('2016-01-01', 'A', 'ru'),
('2016-01-01', 'A', 'ru'),
('2016-01-02', 'A', 'uk'),
('2016-01-01', 'B', 'uk'),
('2016-01-01', 'B', 'de'),
('2016-01-02', 'C', 'ru')
);

delete from orders where exists (
  select order_date, product_id, market from (
    select *, row_number() over (partition by order_date, product_id, market) as rank
    from orders
  ) temp
  where rank > 1
  and orders.order_date = temp.order_date
  and orders.product_id = temp.product_id
  and orders.market = temp.market
);

select * from orders;

