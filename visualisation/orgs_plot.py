import psycopg2

conn = psycopg2.connect("dbname=dbs user=anselm password=KennwortKennwortKennwort")

cur = conn.cursor()

with open("../work/queries/count_queries_with_cast_members.sql", 'r') as file:
    sql_script = file.read()

cur.execute(sql_script)

records = cur.fetchall()

for record in records:
    print(record)

cur.close()
conn.close()