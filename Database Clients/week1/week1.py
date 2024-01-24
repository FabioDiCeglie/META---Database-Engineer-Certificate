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

cursor = connection.cursor()

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