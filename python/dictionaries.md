## 1) Remove the particular key and value pair for diectionary
```
a = {"name": "Nikki", "age": 25, "city": "New York"}

# Remove the key 'name' using dictionary comprehension
a = {k: v for k, v in a.items() if k != "name"}

print(a)
```