import psycopg2
import pandas as pd
from sqlalchemy import create_engine
import sys
  
# Checking if the argument is provided
if len(sys.argv) != 2:
    print("Please provide one argument for database number.")
    sys.exit(1)

# Extracting the argument
n = sys.argv[1]

# Establish connections
conn_string = f'postgresql://airflow:airflow@127.0.0.1/tcgt_0{n}'

db = create_engine(conn_string)
conn = db.connect()
conn1 = psycopg2.connect(
    database=f"tcgt_0{n}",
    user='airflow', 
    password='airflow', 
    host='localhost', 
    port='5432'
)

conn1.autocommit = True
cursor = conn1.cursor()

csv_path = f'./source_system/tcgt_0{n}.csv'
df = pd.read_csv(csv_path)

# Converting data to SQL
df.to_sql('tra_chanh_gia_tay', conn, if_exists='replace')

# Fetching all rows
sql1 = '''select * from tra_chanh_gia_tay'''
cursor.execute(sql1)
for i in cursor.fetchall():
    print(i)
    
conn1.commit()
conn1.close()
print("Success")
