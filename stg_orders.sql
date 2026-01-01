{{ config(materialized='view') }}

select
    "order_id",
    "customer_id",
    "order_date"as order_date,
    "amount"::number(10,2) as order_amount
from {{ source('raw', 'orders') }}