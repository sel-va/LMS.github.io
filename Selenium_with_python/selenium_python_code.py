<<<<<<< HEAD:Selenium_with_python/selenium_python code.py

||||||| b3498ac:Selenium_with_python/selenium_python code.py

    # 1 Data Types: Learn about the different data types in Python, such as integers, floats, strings, lists, and dictionaries.
    # 2 Variables: Learn how to create and use variables in Python.
    # 3 Control Flow: Learn how to control the flow of your program using if-else statements, loops, and functions.

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

#--------------------------------------------------------------------------------------------



#--------------------------------------------------------------------------------------------
=======
>>>>>>> 8f7478de8532772ced1ff6b42afc2023a732bce3:Selenium_with_python/selenium_python_code.py
#All locators in one program
================================

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time

# create a new instance of chrome browser
driver = webdriver.Chrome()

# navigate to the website
driver.get("https://rahulshettyacademy.com/locatorspractice/")

# locate the input field by its id and enter a value
driver.find_element(By.ID, "inputUsername").send_keys("rahul")

# locate the input field by its name and enter a value
driver.find_element(By.NAME, "inputPassword").send_keys("hello123")

# locate the element by its class name and click it
driver.find_element(By.CLASS_NAME, "signInBtn").click()

# locate the error message by its css selector and get its text
print(driver.find_element(By.CSS_SELECTOR, "p.error").text)

# locate the element by its link text and click it
driver.find_element(By.LINK_TEXT, "Forgot your password?").click()

# wait for 1 sec
time.sleep(1)

# locate the input field by its xpath and enter a value
driver.find_element(By.XPATH, "//input[@placeholder='Name']").send_keys("John")

# locate the input field by its css selector and enter a value
driver.find_element(By.CSS_SELECTOR, "input[placeholder='Email']").send_keys("john@rsa.com")

# locate the input field by its xpath and clear its value
driver.find_element(By.XPATH, "//input[@type='text'][2]").clear()

# locate the input field by its css selector and enter a value
driver.find_element(By.CSS_SELECTOR, "input[type='text']:nth-child(3)").send_keys("john@gmail.com")

# locate the input field by its xpath and enter a value
driver.find_element(By.XPATH, "//form/input[3]").send_keys("9864353253")

# locate the element by its css selector and click it
driver.find_element(By.CSS_SELECTOR, ".reset-pwd-btn").click()

# locate the message by its css selector and get its text
print(driver.find_element(By.CSS_SELECTOR, "form p").text)

# locate the element by its xpath and click it
driver.find_element(By.XPATH, "//div[@class='forgot-pwd-btn-conainer']/button[1]").click()

# wait for 1 sec
time.sleep(1)

# locate the input field by its id and enter a value
driver.find_element(By.ID, "#inputUsername").send_keys("rahul")

# locate the input field by its css selector and enter a value
driver.find_element(By.CSS_SELECTOR, "input[type*='pass']").send_keys("rahulshettyacademy")

# locate the checkbox by its id and click it
driver.find_element(By.ID, "chkboxOne").click()

# locate the button by its xpath and click it
driver.find_element(By.XPATH, "//button[contains(@class,'submit')]").click()

