with
payments as (
    select * from {{ ref("stg_stripe__payments") }}
),
orders as (
    select * from {{ ref("stg_jaffle_shop__orders") }}
)
select 
    o.order_id,
    o.customer_id,
    p.amount
from orders o 
inner join payments p
on o.order_id = p.order_id
