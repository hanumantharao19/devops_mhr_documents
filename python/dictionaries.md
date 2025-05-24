# 1)Remove a particular key from a dictionary using pop()
```
data = {"name": "hanu", "age": 25, "city": "Hyd"}

# Remove the key 'name' if it exists
removed_value = data.pop("name", None)

print("After removing 'name':", data)
print("Removed value:", removed_value)
```
## 2) Remove the particular key and value pair Using Dictionary Comprehension
```
data = {"name": "hanu", "age": 25, "city": "Hyd"}

# Create a new dictionary without the 'name' key
filtered_data = {k: v for k, v in data.items() if k != "name"}

print("Original dictionary:", data)
print("Filtered dictionary:", filtered_data)
```
## 3) Reverse the key value key and vaule in the dictionary
```
a = {"name": "hanu", "age": 25, "city": "Hyd"}

# Remove the key 'name' using dictionary comprehension
a = {v: k for k, v in a.items()}

print(a)
```
## 3 Remove the  age and city in the dictionary
names = {"name": "hanu", "age": 25, "city": "hyd","sub": "math","marks": 90}
names = {k: v for k, v in a.items() if k not in ["age","city"]}

print(names)


or

names = {"name": "hanu", "age": 25, "city": "hyd","sub": "math","marks": 90}
remove_key = ["age","city"]
names = {k: v for k, v in a.items() if k not in remove_key}

print(names)

## 4) merged two dictionarines
```
a = {"name": "hanu", "age": 25}
b = {"city": "hyd", "marks": 90}

# Merge two dictionaries
merged = {**a, **b}

print(merged)
```
## 5 )Filter dictionary values (e.g., get only numeric values)
```
a = {"name": "hanu", "age": 25, "marks": 90, "city": "hyd"}

# Get only items where value is of type int
numbers_only = {k: v for k, v in a.items() if isinstance(v, int)}

print(numbers_only)
```
## 6) Count how many times each value appears (using a dictionary)
```
values = ["aws", "gcp", "azure", "aws", "gcp", "aws"]
count = {}
for v in values:
    count[v] = count.get(v, 0) + 1

print(count)
```
## 7)Find the key(subjec name) with the maximum value in a dictionary
```
marks = {"math": 88, "science": 92, "english": 85, "history": 78}

# Find subject with highest marks
top_subject = max(marks, key=marks.get)

print("Top Subject:", top_subject)
```
## 8 Convert two lists into a dictionary
```
keys = ["name", "age", "city"]
values = ["hanu", 25, "hyd"]

# Combine keys and values into a dictionary
combined = dict(zip(keys, values))
print(combined)
```
## 9) Update dictionary value based on a condition
```
prices = {"apple": 100, "banana": 40, "cherry": 120}

# Give 20% discount if price > 100
discounted = {k: (v * 0.8 if v > 100 else v) for k, v in prices.items()}

print(discounted)
```