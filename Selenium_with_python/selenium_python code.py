
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

