
    # 1 Data Types: Learn about the different data types in Python, such as integers, floats, strings, lists, and dictionaries.
    # 2 Variables: Learn how to create and use variables in Python.
    # 3 Control Flow: Learn how to control the flow of your program using if-else statements, loops, and functions.
    
    # 4 Data Structures: Learn how to work with data structures, such as lists, tuples, and dictionaries.
    # 5 File I/O: Learn how to read and write files in Python.
    # 6 Modules and Libraries: Learn how to use built-in and third-party modules and libraries in Python.
    
    # 7 Error Handling: Learn how to handle and raise errors in Python.
    # 8 Object-Oriented Programming: Learn the basics of object-oriented programming in Python.
    # 9 Advanced Topics: Learn about more advanced topics such as decorators, generators, and meta-programming.


#--------------------------------------------------------------------------------------------------------------------------------

#TOPIC 1, 2, 3 
#Python program that covers the topics of data types, variables, and control flow:
#==================================================================================
    # Data Types
    # integers
    x = 5
    y = 10

    # floats
    a = 5.5
    b = 10.1

    # strings
    name = "John Doe"

    # lists
    numbers = [1, 2, 3, 4, 5]

    # dictionaries
    person = {
      "name": "John Doe",
      "age": 30
    }

    # Variables
    # creating and using variables
    x = 5
    y = 10
    result = x + y
    print(result)

    # Control Flow
    # if-else statements
    x = 5
    y = 10

    if x < y:
      print("x is less than y")
    else:
      print("x is greater than or equal to y")

    # loops
    # for loop
    numbers = [1, 2, 3, 4, 5]

    for num in numbers:
      print(num)

    # while loop
    x = 0

    while x < 5:
      print(x)
      x += 1
      
    # functions
    def add_numbers(x, y):
      return x + y

    result = add_numbers(5, 10)
    print(result)

#------------------------------------------------------------------------------------------------------------------------------------
#TOPIC 4,5,6
This program demonstrates examples of working with different data structures such as lists, tuples, and dictionaries. 
It also demonstrates how to read and write files in Python using the built-in open() function and the with statement. 
It also demonstrates how to import and use built-in and third-party modules and libraries in Python such as math and pandas.

# Data Structures
# lists
numbers = [1, 2, 3, 4, 5]

# adding an element to the list
numbers.append(6)

# accessing an element of the list
print(numbers[2])

# removing an element from the list
numbers.remove(5)

# tuples
person = ("John", "Doe", 30)

# accessing an element of the tuple
print(person[1])

# dictionaries
person = {
  "name": "John Doe",
  "age": 30
}

# accessing a value of a key in the dictionary
print(person["name"])

# adding a key-value pair to the dictionary
person["gender"] = "male"

# File I/O
# writing to a file
with open("file.txt", "w") as file:
  file.write("Hello, World!")

# reading from a file
with open("file.txt", "r") as file:
  print(file.read())

# Modules and Libraries
# importing a built-in module
import math

# using a function from the math module
print(math.sqrt(16))

# importing a third-party library
import pandas as pd

# using a function from the pandas library
data = pd.read_csv("data.csv")
print(data)


#-------------------------------------------------------------------------------------------------------------------------------------------

#TOPIC 7 8 9

This program demonstrates examples of handling errors using try-except statement, raising errors using raise statement, 
creating and using classes in object-oriented programming, and advanced topics such as decorators, generators, and meta-programming.

# Error Handling
# using try-except to handle errors
try:
  x = 5 / 0
except ZeroDivisionError:
  print("Cannot divide by zero")

# raising an error
def divide(x, y):
  if y == 0:
    raise ValueError("Cannot divide by zero")
  return x / y

try:
  result = divide(5, 0)
  print(result)
except ValueError as e:
  print(e)

# Object-Oriented Programming
# creating a class
class Person:
  def __init__(self, name, age):
    self.name = name
    self.age = age

# creating an object of the class
person = Person("John Doe", 30)

# accessing the object's attributes
print(person.name)
print(person.age)

# Advanced Topics
# decorators
def decorator_function(original_function):
  def wrapper_function():
    print("Wrapper executed before {}".format(original_function.__name__))
    return original_function()
  return wrapper_function

@decorator_function
def display():
  print("Display function ran")

display()

# generators
def square_numbers(nums):
  for i in nums:
    yield i*i

my_nums = square_numbers([1, 2, 3, 4, 5])

for num in my_nums:
  print(num)

# meta-programming
class MyClass:
  pass

obj = MyClass()
obj.x = 5
print(obj.x)

#-----------------------------------------------------------------------------------------------------------------------------------