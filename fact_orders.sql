select
    o."order_id",
    o."customer_id",
    o.order_date,
    o.ORDER_AMOUNT
from {{ ref('stg_orders') }} o