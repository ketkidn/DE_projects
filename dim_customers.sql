select
    customer_id,
    customer_name,
    email,
    created_date
from {{ ref('stg_customers') }}