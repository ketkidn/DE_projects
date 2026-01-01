import snowflake.connector
from snowflake.connector.pandas_tools import write_pandas
import os
from dotenv import load_dotenv
from extract_sqlserver import extract_customers

load_dotenv()

df = extract_customers()

ctx = snowflake.connector.connect(
    user=os.getenv("SNOW_USER"),
    password=os.getenv("SNOW_PASSWORD"),
    account=os.getenv("SNOW_ACCOUNT"),
    warehouse=os.getenv("SNOW_WAREHOUSE"),
    database=os.getenv("SNOW_DATABASE"),
    schema=os.getenv("SNOW_SCHEMA")
)

table_name = "ORDERS"

success, nchunks, nrows, _ = write_pandas(
    conn=ctx,
    df=df,
    table_name=table_name,
    auto_create_table=True
)

print(f"Loaded {nrows} rows into Snowflake")

ctx.close()

