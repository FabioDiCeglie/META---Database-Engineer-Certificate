import mysql.connector as connector

print("Establishing a new connection between MySQL and Python.")

try:
    connection = connector.connect(
        user="root",
        password="",
        database="little_lemon")

except connector.Error as er:
    print("Error code:", er.errno)
    print("Error message:", er.msg)

if connection and connection.is_connected():
    connection.close()
    print("MySQL connection is closed.")
else:
    print("Connection is already closed")

cursor = connection.cursor(buffered= True)

cursor.execute("SHOW DATABASES")
for database in cursor:
    print(database)

connection.database
create_menuitem_table = """CREATE TABLE MenuItems (
ItemID INT AUTO_INCREMENT,
Name VARCHAR(200),
Type VARCHAR(100),
Price INT,
PRIMARY KEY (ItemID)
);"""
cursor.execute(create_menuitem_table)
cursor.execute("SHOW TABLES")
for table in cursor:
    print(table)

create_menu_table = """CREATE TABLE Menus (
MenuID INT,
ItemID INT,
Cuisine VARCHAR(100),
PRIMARY KEY (MenuID,ItemID)
);"""
cursor.execute(create_menu_table)
cursor.execute("SHOW TABLES")
for table in cursor:
    print(table)

# Task 1
cursor.execute("USE little_lemon")
cursor.execute("SHOW TABLES")

results = cursor.fetchall()

# Using for loop to print the names of all the tables
for table in results:
    print(table)

# Task 2
cursor.execute("USE little_lemon")
cursor.execute("SELECT * FROM MenuItems")
cursor.execute("SELECT * FROM Menus")

# Task 3 Dictionary object

dic_cursor = connection.cursor(dictionary= True)

# Set database in use
dic_cursor.execute('USE little_lemon;')

# SQL query to GET the name of the tables
dic_cursor.execute("SHOW TABLES;")

# Retrieve the query outcomes
results = dic_cursor.fetchall()

for table in results:
    print(table)
