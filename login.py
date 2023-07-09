from selenium import webdriver
from selenium.webdriver.chrome.options import Options as ChromeOptions
import datetime
from selenium.webdriver.common.by import By
from time import sleep
import chromedriver_autoinstaller

chromedriver_autoinstaller.install()  # Install Chrome driver

def login(user, password):
    print(timestamp() + 'Starting the browser...')
    options = ChromeOptions()
    options.add_argument('--no-sandbox')
    options.add_argument("--headless") 
    driver = webdriver.Chrome(options=options)
    print(timestamp() + 'Browser started successfully. Navigating to the demo page to login.')
    driver.get('https://www.saucedemo.com/')
    # login
    driver.get("https://www.saucedemo.com");
    driver.find_element(By.ID, "user-name").send_keys("standard_user")
    driver.find_element(By.ID, "password").send_keys("secret_sauce");
    driver.find_element(By.ID, "login-button").click();
    assert "Products" in product_label
    print(timestamp() + 'Login with username {:s} and password {:s} successfully.'.format(user, password))
    return driver

def add_cart(driver, n_items):
    for i in range(n_items):
        element = "a[id='item_" + str(i) + "_title_link']"  # Get the URL of the product
        driver.find_element(By.Class_Name, element).click()  # Click the URL
        driver.find_element(By.Class_Name, "button.btn_primary.btn_inventory").click()  # Add the product to the cart
        product = driver.find_element_by_css_selector("div[class='inventory_details_name']").text  # Get the name of the product from the page
        print(timestamp() + product + " added to shopping cart.")  # Display message saying which product was added
        driver.find_element_by_css_selector("button.inventory_details_back_button").click()  # Click the Back button
    print(timestamp() + '{:d} items are all added to shopping cart successfully.'.format(n_items))

def remove_cart(driver, n_items):
    for i in range(n_items):
        element = "a[id='item_" + str(i) + "_title_link']"
        driver.find_element_by_css_selector(element).click()
        driver.find_element_by_css_selector("button.btn_secondary.btn_inventory").click()
        product = driver.find_element_by_css_selector("div[class='inventory_details_name']").text
        print(timestamp() + product + " removed from shopping cart.")  # Display message saying which product was added
        driver.find_element_by_css_selector("button.inventory_details_back_button").click()
    print(timestamp() + '{:d} items are all removed from shopping cart successfully.'.format(n_items))

def timestamp():
    ts = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    return (ts + '\t')

chromedriver_autoinstaller.install()  # Install Chrome driver

driver = webdriver.Chrome()

driver = login(TEST_USERNAME, TEST_PASSWORD)

# Set options for not prompting DevTools information
options = Options()
options.add_experimental_option("excludeSwitches", ["enable-logging"])

print("testing started")
driver = webdriver.Chrome(options=options)

driver.get("https://www.saucedemo.com/")
sleep(3)

print("testing add to cart")
add_to_cart_btns = driver.find_elements(By.CLASS_NAME, "btn_inventory")

# Click three buttons to make the cart_value 6
for btns in add_to_cart_btns[:6]:
     btns.click()

if __name__ == "__main__":
    N_ITEMS = 6
    TEST_USERNAME = 'standard_user'
    TEST_PASSWORD = 'secret_sauce'
    driver = login(TEST_USERNAME, TEST_PASSWORD)
    add_cart(driver, N_ITEMS)
    remove_cart(driver, N_ITEMS)
    print(timestamp() + 'Selenium tests are all successfully completed!')
