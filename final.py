import mysql.connector as connector

connection = connector.connect(user = "root", password = "root",  db = "LittleLemonDB")
print("Connection between MySQL and Python is established.\n")

# Create cursor object to communicate with entire MySQL database
cursor = connection.cursor()
print("Cursor is created to communicate with the MySQL using Python.\n")

show_tables_query = "SHOW tables"
cursor.execute(show_tables_query)
results = cursor.fetchall()

# Execute the query to retrieve orders
get_orders_query = """
    SELECT customers.name, customers.email, customers.number
    FROM customers
    JOIN orders ON customers.customerID = orders.customerID
    WHERE orders.totalCost > 60
"""
cursor.execute(get_orders_query)

# Fetch all the results
results_orders = cursor.fetchall()

# Print the results
for row in results_orders:
    print(row)

# Let's close the cursor and the connection
if connection.is_connected():
    cursor.close()
    print("The cursor is closed.")
    connection.close()
    print("MySQL connection is closed.")
else:
    print("Connection is already closed")