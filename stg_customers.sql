select
    "customer_id"    as customer_id,
    upper("name" )          as customer_name,
    "email"          as email,
    "created_at" as created_date
from {{ source('raw', 'customers') }}
