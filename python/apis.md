## 1) Make get request to the public api
```
import requests

# Define the API endpoint
url = "https://api.agify.io/?name=nikki"

# Send GET request
response = requests.get(url)

# Check if the request was successful
if response.status_code == 200:
    data = response.json()
    print("Predicted age data:", data)
else:
    print("Failed to fetch data. Status code:", response.status_code)
```
```
import requests

url = "https://reqres.in/api/users"

payload = {
    "name": "Hanu",
    "job": "DevOps Engineer"
}

response = requests.post(url, json=payload)

if response.status_code == 201:
    print("Data posted successfully!")
    print(response.json())
else:
    print("Failed to post data. Status code:", response.status_code)
```

```
import requests

# API endpoint with query params
url = "https://reqres.in/api/users"
params = {"page": 2}

response = requests.get(url, params=params)

if response.status_code == 200:
    data = response.json()
    print("User data from page 2:")
    print(data)
else:
    print("Failed to fetch data. Status code:", response.status_code)
```
```
import requests

# Mock DELETE API
url = "https://reqres.in/api/users/2"

response = requests.delete(url)

if response.status_code == 204:
    print("User deleted successfully (mock).")
else:
    print("Failed to delete user. Status code:", response.status_code)
```


