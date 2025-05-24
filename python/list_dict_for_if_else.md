## 10) average the values in the list
```
# iterating Lists
marks = [68,79,81,96,76,99]
total = 0
for x in marks:
    total += x
    average = total/len(marks)
print(average)
```

## sum of the all numbers
```
numbers = [10,20,30,40,50,60]
totatl_amount = 0
for number in range(0,len(numbers)):
    totatl_amount = totatl_amount + numbers[number]
print(totatl_amount)
```

## 10) find the smalest value  in the list

```
x = [10,20,40,5,50,60]
smallest = x[0]
for z in x:
    if z < smallest:
       smallest = z
       
print(smallest)
```
## 11) find the larget number in the list
```
numbers = [10,5,20,40,100,4]
smallest = numbers[0]
for a in numbers:
    if a > smallest:
      smallest = a
print(smallest)

```
## 12) remove the duplicate values
```
numbers = [10,20,30,10,20,30,40,100]
original = []
for a in numbers:
   if a not in original:
       original.append(a)
print(original)
```

## 13) find the common elments in the two list
```
x = [10,20,30,40,50,60]
y = [50,60,70,80,90,100]

common = []
for a in x:
  if a in y:
     common.append(a)
print(common)

```

## 14) Purpose of zip function
```
list1 = [2,3,4]
list2 = [5,6,7]
for a, b in zip(list1,list2):
    print(a + b)

```
## 15) add the elments in the two lists
```
a = [1, 3, 4, 6, 8]
b = [4, 5, 6, 2, 10]

c= [ x + y for x, y in zip(a, b)]

print(c)
```

## 16) add numbers in two lists
```
list1 = [1, 2, 3]
list2 = [4, 5, 6]

result = []
for i in range(len(list1)):
    result.append(list1[i] + list2[i])

print(result)  # Output: [5, 7, 9]
```
## 17) print the numbers form the tuples with loop
```
tuples = (1,2,3,4,5,6,7,8,9,10)
for a in tuples:
    print(a)
```
## 18) Print the numebrs form list with loop
```
list = [(1,2),(3,4),(5,6),(7,8),(9,10)]
for item in list:
    print(item)

for (a,b) in list2:
    print(a)
    print(b)

list = [(1,2,11),(3,4,12),(5,6,13),(7,8,14),(9,10,15)]
for a,b,c in list:
    print(c)

```
# Flatten a nested list
```
nested = [[1, 2], [3, 4], [5, 6]]
flattened = []

for sublist in nested:
    for item in sublist:
        flattened.append(item)

print(flattened) 
```
## print triangle pattern of asterisks using nested loop
```
rows = 5
for i in range(1, rows + 1):
    for j in range(i):
        print("*", end=" ")
    print()
```





# 8 Check if a DevOps tool is in use
```
tools = ["jenkins", "docker", "kubernetes", "terraform"]
tool_name = input("Enter tool name: ")

if tool_name in tools:
    print(f"{tool_name} is in use.")
else:
    print(f"{tool_name} is not used.")
```

## 6) elment is available or not with for loop
```
list = ["mahesh","hanu","suresh","ramesh"]
available = ""
name = "ram"
for a in list:
    if a == name:
       available = True
       break
if available:
    print("Element is avaialble in the list")
else:
    print("Element is not avaialble in the list")
```

# Check if a Number is Prime
```
# Check if a number is prime
number = int(input("Enter a number: "))

if number > 1:
    for i in range(2, number):
        if (number % i) == 0:
            print(f"{number} is not a prime number")
            break
    else:
        print(f"{number} is a prime number")
else:
    print(f"{number} is not a prime number")


# Count frequency of each element in a list
```
numbers = [1, 2, 2, 3, 4, 4, 4, 5]
frequency = {}

for num in numbers:
    if num in frequency:
        frequency[num] += 1
    else:
        frequency[num] = 1

print(frequency)
```
# Print a Pyramid of Stars
rows = 5
for i in range(1, rows + 1):
    # Printing spaces
    for j in range(rows - i):
        print(" ", end="")
    
    # Printing stars
    for k in range(2 * i - 1):
        print("*", end="")
    
    # Moving to the next line
    print()


