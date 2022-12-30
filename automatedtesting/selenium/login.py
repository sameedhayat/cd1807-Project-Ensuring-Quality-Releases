# #!/usr/bin/env python
from datetime import datetime
from selenium import webdriver
from selenium.webdriver.chrome.options import Options as ChromeOptions

from datetime import datetime

old_print = print

def timestamped_print(*args, **kwargs):
  old_print(datetime.now(), *args, **kwargs)

print = timestamped_print

# Start the browser and login with standard_user
def login (user, password):
    print ('Browser started successfully. Navigating to the demo page to login.')
    driver.get('https://www.saucedemo.com/')        
    driver.find_element_by_css_selector("input[id='user-name']").send_keys(user)
    driver.find_element_by_css_selector("input[id='password']").send_keys(password)
    driver.find_element_by_id("login-button").click()
    print('User {} logged in: SUCCESS '.format(user))

def addAllItems(driver):

    inventory_list = driver.find_elements_by_class_name("inventory_list")
    for item in inventory_list:
        item_description = item.find_elements_by_class_name('inventory_item_name')[0].text
        item.find_elements_by_class_name('btn_inventory')[0].click()
        print("Item {} added to Shopping Cart".format(item_description))
    
    print("Total {} added to Shopping Cart".format(len(inventory_list)))
    
def removeAllItems(driver):

    inventory_list = driver.find_elements_by_class_name("inventory_list")
    for item in inventory_list:
        item_description = item.find_elements_by_class_name('inventory_item_name')[0].text
        item.find_elements_by_class_name('btn_inventory')[0].click()
        print("Item {} removed from Shopping Cart".format(item_description))
    
    print("Total {} removed to Shopping Cart".format(len(inventory_list)))
  


if __name__ == "__main__":
    options = ChromeOptions()
    options.add_argument("--headless") 
    driver = webdriver.Chrome(options=options)
    
    
    login(driver, 'standard_user', 'secret_sauce')
    addAllItems(driver)
    removeAllItems(driver)

    print('All tests completed: SUCCESS')