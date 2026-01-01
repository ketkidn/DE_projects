# extract_sqlserver.py
import pyodbc
import pandas as pd
import os
from dotenv import load_dotenv

load_dotenv()

def extract_customers():
    conn = pyodbc.connect(
        f"DRIVER={{ODBC Driver 18 for SQL Server}};"
        f"SERVER={os.getenv('SQL_SERVER')};"
        f"DATABASE={os.getenv('SQL_DB')};"
        f"UID={os.getenv('SQL_USER')};"
        f"PWD={os.getenv('SQL_PASSWORD')};"
        "TrustServerCertificate=yes;"
    )

    query = "SELECT * FROM ORDERS"
    df = pd.read_sql(query, conn)
    conn.close()

    return df
