import cv2
from picamera2 import Picamera2
from ultralytics import YOLO
from RPLCD.i2c import CharLCD
from datetime import datetime
import time
import requests
import json

# firebase REST API setup
project_id = "ai-trolley-f8b2e"
bill_collection_id = "bill_id"
base_url = f"https://firestore.googleapis.com/v1/projects/{project_id}/databases/(default)/documents/"

access_token = #token

headers = {
    "Authorization": f"Bearer {access_token}",
    "Content-Type": "application/json"
}

# add bill item to firestore
def addItem(billId: str, itemName: str, price: float):
    time = datetime.now().strftime("%Y%m%dT%H%M%S")
    print(time)
    url = f"{base_url}bills/{billId}/items?documentId={time}"
    data = {
        # "documentId": "dummy",
        "fields": {
            "item": {"stringValue": itemName},
            "time": {"stringValue": time},
            "price": {"doubleValue": price},
        }
    }

    response = requests.post(url, headers=headers, data=json.dumps(data))
    print("responce:  ", response.json())


# add bill to cloud store
def saveBill(bill_id: str, price: float, user_id: str):
    url = f"{base_url}bills?documentId={bill_id}"

    data = {
        "fields" : {
            "bill_id" : {"stringValue": bill_id},
            "price": {"doubleValue": price},
            "pay_type": {"stringValue": "upi"},
            "user_id": {"stringValue": user_id},
        }
    }

    response = requests.post(url, headers=headers, data=json.dumps(data))
    print("responce:  ", response.json())

def getUId():
    return "user1"


# display item on lcd
def display_item(item_name):
    lcd.clear()
    lcd.write_string(f"Detected: {item_name}")
    lcd.write_string(f"Price: ${product_data[item_name]}")

#init trolley
def trolley_init(billId: str):
    t_url = "https://testfirestore-nzrovfidiq-uc.a.run.app"
    res = requests.post(t_url, json={
        "trolleyId":"Trolley1",
        "bill_id" : billId
    })
    print(res)

# Initialize the Picamera
picam2 = Picamera2()
picam2.preview_configuration.main.size = (640, 480)
picam2.preview_configuration.main.format = "RGB888"
picam2.preview_configuration.align()
picam2.configure("preview")
picam2.start()

# Initialize the LCD (I2C address is assumed as 0x27)
lcd = CharLCD('PCF8574', 0x27)

# Load the YOLO model
model = YOLO('Tolley.pt')

# Sample product data with corresponding prices
product_data = {
    "Colgate": 10,
    "Hamam": 20,
    "lifebuoy":30
    # Add more products as needed
}

# Initialize counters and total price
count = 0
total_price = 0.0
prev = None
bill = []
bill_id = "trolley1_" + datetime.now().strftime("%Y%m%dT%H%M%S")
user_id = getUId()

# Clear LCD display
lcd.clear()

trolley_init(bill_id)

while True:
    im = picam2.capture_array()

    count += 1
    if count % 3 != 0:
        continue

    im = cv2.flip(im, -1)
    res = model.predict(im, conf=0.5)
    
    for result in res :
        for detection in result.boxes:
            curr = detection.cls.item()
            if prev == curr:
                break
            
            prev = curr            
            item_name = model.names[curr]
            bill.append(item_name)
            display_item(item_name)
            total_price += product_data[item_name]
            addItem(bill_id, item_name, product_data[item_name])
    
    im = res[0].plot()

    # Display the current frame
    cv2.imshow("Preview", im)

    # Exit if 'q' is pressed
    if cv2.waitKey(1) == ord('q'):
        break

# After exiting the loop, display the total price
lcd.clear()
total_price_rounded = round(total_price)
lcd.write_string(f"Total:{total_price_rounded}")
print("final bill: ", bill)
cv2.destroyAllWindows()

saveBill(bill_id, total_price_rounded, user_id)

time.sleep(5)  # Show total for 5 seconds before exiting
lcd.clear()
print("final bill: ", bill)