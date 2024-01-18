### Alghoritms

# O(1) - Constant Time

def access_index(arr, index):
    return arr[index]

# No matter how large the array is, accessing an element by its index takes the same amount of time. The runtime is constant, and we denote it as O(1).

# O(n) - Linear Time

def linear_search(arr. target):
    for item in arr:
        if item == target:
            return True
    return False

# As the size of the list (arr) increases, the number of iterations the loop performs also increases linearly. 
# Therefore, this algorithm has a time complexity of O(n).

# O(n^2) - Quadratic Time

def bubble_sort(arr):
    n = len(arr)
    for i in range(n):
        for j in range (0, n - i - 1):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]

# Bubble sort has a time complexity of O(n^2). As the size of the input list (arr) increases, 
# the number of comparisons and swaps grows quadratically.

# O(log n) - Logarithmic Time

def binary_search(arr, target):
    left,right = 0, len(arr) - 1
    while left <= right:
        mid = (left + right) // 2
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return - 1

# Binary search drastically reduces the search time as the size of the sorted list (arr) grows. 
# It has a time complexity of O(log n).

#########################################

# Input data: List of dictionaries
employee_list = [
   {"id": 12345, "name": "John", "department": "Kitchen"},
   {"id": 12456, "name": "Paul", "department": "House Floor"},
   {"id": 12478, "name": "Sarah", "department": "Management"},
   {"id": 12434, "name": "Lisa", "department": "Cold Storage"},
   {"id": 12483, "name": "Ryan", "department": "Inventory Mgmt"},
   {"id": 12419, "name": "Gill", "department": "Cashier"}
]

# Function to be passed to the map() function. Do not change this.
def mod(employee_list):
   temp = employee_list['name'] + "_" + employee_list["department"]
   return temp

def to_mod_list(employee_list):
   """ Modifies the employee list of dictionaries into list of employee-department strings

   [IMPLEMENT ME] 
      1. Use the map() method to apply mod() to all elements in employee_list

   Args:
      employee_list: list of employee objects

   Returns:
      list - A list of strings consisting of name + department.
   """
   ### WRITE SOLUTION CODE HERE
   r = employee_list.copy()
   new_list = map(mod, r)
   return list(new_list)

   raise NotImplementedError()

def generate_usernames(mod_list):
   """ Generates a list of usernames 

   [IMPLEMENT ME] 
      1. Use list comprehension and the replace() function to replace space
         characters with underscores

      List comprehension looks like:
      list = [ function() for <item> in <list> ]

      The format for the replace() function is:

      test_str.replace(“a”, “z”) # replaces every “a” in test_str with “z”

   Args:
      mod_list: list of employee-department strings

   Returns:
      list - A list of usernames consisting of name + department delimited by underscores.
   """
   ### WRITE SOLUTION CODE HERE
   new_list = [i.replace(" ", "_") for i in mod_list]
   return new_list

   raise NotImplementedError()

def map_id_to_initial(employee_list):
   """ Maps employee id to first initial

   [IMPLEMENT ME] 
      1. Use dictionary comprehension to map each employee's id (value) to the first letter in their name (key)

      Dictionary comprehension looks like:
      dict = { key : value for <item> in <list> }

   Args:
      employee_list: list of employee objects

   Returns:
      dict - A dictionary mapping an employee's id (value) to their first initial (key).
   """
   ### WRITE SOLUTION CODE HERE
   new_list = { i["name"][0] : i["id"] for i in employee_list }
   return new_list

   raise NotImplementedError()

def main():
   mod_emp_list = to_mod_list(employee_list)
   print("Modified employee list: " + str(mod_emp_list) + "\n")

   print(f"List of usernames: {generate_usernames(mod_emp_list)}\n")

   print(f"Initials and ids: {map_id_to_initial(employee_list)}")

if __name__ == "__main__":
   main()

####  Object Oriented Programming

class MyFirstClass():
    print("Who wrote this?")
    index = "Author-Book"

    def hand_list(self, philosopher, book):
        print(MyFirstClass.index)
        print(philosopher + " wrote the book: " + book)

whodunnit = MyFirstClass()
whodunnit.hand_list("Sun Tzu", "The Art of War")


#### Abstract Classes

# Import ABC and abstractmethod from the module abc (which stands for abstract base classes)
from abc import ABC, abstractmethod

# Class Bank
class Bank(ABC):
    """ An abstract bank class

    [IMPLEMENT ME]
        1. This class must derive from class ABC
        2. Write a basicinfo() function that prints out "This is a generic bank" and
           returns the string "Generic bank: 0" 
        3. Define a second function called withdraw and keep it empty by
           adding the `pass` keyword under it. Make this function abstract by
           adding an '@abstractmethod' tag right above the function declaration.
    """
    ### YOUR CODE HERE
    def basicinfo():
        print("This is a generic bank")
        return "Generic bank: 0"
    
    @abstractmethod
    def withdraw(self):
        pass


# Class Swiss
class Swiss(Bank):
    """ A specific type of bank than derives from class Bank

    [IMPLEMENT ME]
        1. This class must derive from class Bank
        2. Create a constructor for this class that initializes a class
           variable `bal` to 1000
        3. Implement the basicinfo() function so that it prints "This is the 
           Swiss Bank" and returns a string with "Swiss Bank: " (don't forget
           the space after the colon) followed by the current bank balance.

           For example, if self.bal = 80, then it would return "Swiss Bank: 80"

        4. Implement withdraw so that it takes one argument (in addition to
           self) that is an integer which represents the amount to be withdrawn
           from the bank. Deduct the withdrawn amount from the bank bal, print 
           the withdrawn amount ("Withdrawn amount: {amount}"), print the new
           balance ("New Balance: {self.bal}"), and return the new balance.

           Note: Make sure to verify that there is enough money to withdraw!  
                 If amount is greater than balance, then do not deduct any 
                 money from the class variable `bal`. Instead, print a 
                 statement saying `"Insufficient funds"`, and return the 
                 original account balance instead.
    """
    ### YOUR CODE HERE
    def __init__(self):
       self.bal = 1000
    
    def basicinfo(self):
        print("This is the Swiss Bank")
        return f"Swiss Bank: {self.bal}"
    
    def withdraw(self, amount):
        print(f"Withdrawn amount: {amount}")

        if amount > self.bal:
            print("Insufficient funds")
            return self.bal

        self.bal -= amount
        print(f"New Balance: {self.bal}")
        return self.bal


# Driver Code
def main():
    assert issubclass(Bank, ABC), "Bank must derive from class ABC"
    s = Swiss()
    print(s.basicinfo())
    s.withdraw(30)
    s.withdraw(1000)

if __name__ == "__main__":
    main()

