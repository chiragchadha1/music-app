import requests
import json

# Define the URL of the endpoint
url = "http://127.0.0.1:5000/signup"

# Define the data you want to send
data = {
    "firstName": "John",
    "lastName": "Doe",
    "username": "johndoe",
    "email": "johndoe@example.com",
    "password": "password123"
}

# Send the POST request
response = requests.post(url, data=json.dumps(data), headers={'Content-Type': 'application/json'})

# Print the response
print(response.text)
