from selenium import webdriver
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.common.by import By
from datetime import datetime
import logging
logging.basicConfig(filename="./seleniumlog.txt", format="%(asctime)s %(message)s",
                    filemode="w", level=logging.INFO, datefmt="%Y-%m-%d %H:%M:%S")
# #!/usr/bin/env python
from selenium import webdriver
from selenium.webdriver.chrome.options import Options as ChromeOptions


# Start the browser and login with standard_user
def login (user, password):
    print ('Starting the browser...')
    # --uncomment when running in Azure DevOps.
    options = ChromeOptions()
    options.add_argument("--headless") 
    options.add_argument("--no-sandbox")
    driver = webdriver.Chrome(options=options)
    #driver = webdriver.Chrome()
    print ('Browser started successfully. Navigating to the demo page to login.')
    driver.get('https://www.saucedemo.com/')
    driver.find_element_by_css_selector("input[id='user-name']").send_keys(user)
    driver.find_element_by_css_selector("input[id='password']").send_keys(password)
    driver.find_element_by_id("login-button").click()

# login
    print('Logging in...')
    logging.info('Logging in...')
    login_user = driver.find_element_by_id("user-name")
    login_password = driver.find_element_by_id("password")
    login_user.send_keys(user)
    login_password.send_keys(password)
    driver.find_element_by_id("login-button").click()
    if WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.ID, "inventory_container"))):
        print('The Login was successful by the user name: ' + user)
        logging.info('The Login was successful by the user name: ' + user)
    else:
        print('The login was unsuccessful')
        logging.info('The login was unsuccessful')
        driver.close()
    # List of inventory
    productList = driver.find_elements_by_class_name("inventory_list")
    items = driver.find_elements_by_class_name("inventory_item_name")
    addList = driver.find_elements_by_css_selector(
        "button[class='btn_primary btn_inventory']")
    removeList = driver.find_elements_by_css_selector(
        "button[class='btn_secondary btn_inventory']")
    # Add items to cart
    print("Adding all products to cart")
    logging.info("Adding all products to cart")
    for item in items:
        print("Adding " + item.text + " to cart")
        logging.info("Adding " + item.text + " to cart")
    for btn in addList:
        btn.click()
    print("All the products are added to cart")
    logging.info("All the products are added to cart")
    # removing the products
    for item in items:
        print("Removing " + item.text + " from cart")
        logging.info("Removing " + item.text + " from cart")
    for btn in removeList:
        btn.click()
    print("All products are removed from cart")
    logging.info("All products are removed from cart")
    driver.close()
login('standard_user', 'secret_sauce')

#Create a UI Test suite for https://www.saucedemo.com/ that adds all products to a cart, and then removes them. Remember, there's a login.py file available in the automatedtesting/selenium/ directory. Executing the login.py file will open the demo site.
#Include print() commands throughout the tests so the actions of the tests can easily be determined. E.g. A login function might return which user is attempting to log in and whether or not the outcome was successful.
#Deploy the UI Test Suite to the linux VM and execute the Test Suite via the CI/CD pipeline.
#Direct the output of the Selenium Test Suite to a log file. Configure custom logging in Azure Monitor to ingest this log file. This may be done non-CI/CD.

  
