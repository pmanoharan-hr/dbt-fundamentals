select 

id as payment_id,
orderid as order_id,
paymentmethod,
status,
amount,
created
from
default.stripe_payments