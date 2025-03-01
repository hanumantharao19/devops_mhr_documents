## 5) print the values form the list
list = ["hanu","haswi","abhay","sras"]
print(list)
## 6) slicing operation form list
```
names = ["hanu","ram","ramesh","suresh"]
print(names[:])
print(names[ ::-4])
print(names[:2])
print(names[1:])
print(names[:-1])
print(names[::-1])
print(len(names))
```

## 7) insert,append,reverse and sort opeations on list
```
# Methods which are used for list
##append and insert methods
list = ["hanu","haswi","abhay","sras"]
print(list)
list.append("suresh") # add the string at the end of the list
print(list)
list.insert(1,"hanuman")  # add the string at index postion
print(list)
```

### swap the strings###
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

## Sort method###
numbers = [40,20,100,467,500,67,700,86,900]
numbers.sort()  ## it print the numbers in assending orders
print(numbers)

## reverse method##
```
numbers = [40,20,100,467,500,67,700,86,900]
numbers.reverse()
print(numbers)
```

### clear the index
```
list = ["hanu","ramesh","suresh","ganesh"]
list.clear()
print(list)

```
## 9) find elements in list
```
names = ["hanu","ram","sras","mahesh","suresh"]
print("hanu" in names)
print("hanu" not in names)
```