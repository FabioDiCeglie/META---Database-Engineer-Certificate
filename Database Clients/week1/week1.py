import mysql.connector as connector

print("Establishing a new connection between MySQL and Python.")

try:
    connection=connector.connect(
        user="ameta",
        password="password",
        database = "test")

except connector.Error as er:
    print("Error code:", er.errno)
    print("Error message:", er.msg)

if connection.is_connected():
    connection.close()
    print("MySQL connection is closed.")
else:
    print("Connection is already closed")