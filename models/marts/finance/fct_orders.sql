with
payments as (
    select * from {{ ref("stg_stripe__payments") }}
),
orders as (
    select * from {{ ref("stg_jaffle_shop__orders") }}
),
order_payments as (
    select 
        order_id,
        sum (case when status = 'success' then amount end) as amount    
    from payments
    group by order_id
),
final as (select 
    orders.order_id,
    orders.customer_id,
    orders.order_date,
    order_payments.amount 
from orders 
left join order_payments using (order_id)
)

select * from final
