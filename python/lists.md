## 1) print the values form the list
```
names = ["hanu", "100","haswi", "suresh","hanu"]
print(names)
```
## 2) slicing operation form list
# sequence[start:stop]
# sequence[start:stop:step]
```
names = ["hanu", "100", "haswi", "suresh" ,"hanu"]
# Indexes:    0       1       2         3    4

```

```
names = ["hanu","100","haswi","suresh,"hanu"]
print(names[:])
print(names[1:])
print(names[:2])
print(names[:-1])
print(names[::2])
print(names[::-2])
print(names[::-1])
print(names[ ::-4])
print(len(names))
```
## 3) Usefull Meathods in Python
names = ["hanu","100","haswi","suresh","hanu"]
print(list)
# append() – Add one item at the end
```
names.append("ravi")
print(names)
```
# extend() – Add multiple items from another list
```
names.extend(["manu", "raju"])
print(names)
```
# insert(index, value) – Insert item at a specific index
```
list.insert(2,"janu")
print(list)
```
# remove(value) – Remove first match of the item
```
names.remove("suresh")
print(names)
```
# pop([index]) – Remove and return item at index
 - remove the elment at last index
```
last_name = names.pop() 
print(last_name)         
print(names)  
``` 
 - Remove the elment at the index 1      
```
second_name = names.pop(1)
print(second_name)      
print(names)        
```
# index(value) – Find position of an item
```
print(names.index("haswi"))
```
# count(value) – Count occurrences of an item
```
print(names.count("hanu"))
```
# sort() – Sort items in ascending order
```
names.sort()
print(names)
```
```
numbers = [40,20,100,467,500,67,700,86,900]
numbers.sort()  ## it print the numbers in assending orders
print(numbers)
```
# reverse() – Reverse the list in-place
```
names.reverse()
print(names)
```
# copy() – Create a copy of the list
```
new_list = names.copy()
print(new_list)
```
# clear() – Remove all elements
```
names.clear()
print(names)
```

### 4) swap the strings###
```
names = ["hyderabad","guntur","vijayawada"]
temp = names[0]
names[0] = names[1]
names[1] = temp
print(names)
```
or
### Alternative approach
```
names = ["hyderabad","guntur","vijayawada"]
names[0],names[1] = names[1],names[0]
print(names)
```
## 5) find elements in list
```
names = ["hanu","ram","sras","mahesh","suresh"]
print("hanu" in names)
print("hanu" not in names)
```
# Nested list 
```
services = [
    ["nginx", "running"],
    ["httpd", "stopped"]
]
print("httpd service status:", services[1][1])
```