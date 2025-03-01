#### loops concept ########
## 1) print the letters form the string with loop
```
name = "hanumantharao"
for a in name:
    print(a)
for a in "ramesh":
    print(a)
```
## 2) print the numbers form the list with loop
```
list1 = [1,2,3,4,5,6,7,8]

for x in list1:
    print(x)
```
# 3) how to use inner loops
```
for x in [1,2,3]:
   for y in [10,20,30]:
        z = x*y
        print(z)

```
or
```

for x in [1,2,3]:
   for y in [10,20,30]:
        print(x*y)

```
## 4) print the even numbers for the list

```
# print even numebrs
list1 = [1,2,3,4,5,6,7,8,9,10]
for x in list1:
    if x % 2 == 0:
        print(x)
```
or
```
## list the even numbers
list = [10,15,20,40,60,80]
for a in list:
    if a % 2 == 0:
      print(a, end=" ")
```

or
```
list = [10,15,13,17,20,40,34,40]
for a in list:
    if a % 2 != 0:
        print(a ,end=" ")
```
or
```
number1 = int(input("enter first number"))
number2 = int(input("enter final number"))
for a  in range(number1,number2+1):
    if a % 2 == 0:
     print(a , end=" ")
```

## 5) how to use pass,continue and break in for loops

- how to use pass
```
x = [1,2,3,4]
for a in x:
    pass
print("script complete successfully")

```
- how to use continue
```
x = [1,2,3,4,5,6,7,8,9,10]
for a in x:
    if a == 5:
        continue
    print(a)
```
- how to use break in for loop
```
x = [1,2,3,4,5,6,7,8,9,10]
for a in x:
    if a == 6:
        break
    print(a)
```
- how to use break in while loop
```
x = 0
while x < 5:
    if x == 2:
     break
    print(x)
    x = x + 1
```
### 6) elment is available or not with for loop
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
## 7) Print the values with while loop
```
#while loop will continue to execute a block of code while some condtion reamins ture
# while condtion:
  #do some thing
# else:
  # do some thing different
x = 0
while x < 5 :
    print(f'current value of x is {x}')
    x = x + 1

x = 6
while x < 5 :
    print(f'current value of x is {x}')
    x += 1
else:
    print( "x is not grater than 5")
```

## 8) how to use range function
```
for number in range(10):
    print(number)


for number in range(5,25):
    print(number)


for number in range(5,25,5):
    print(number)
```

## 9) average the values in the list
```
# iterating Lists
marks = [68,79,81,96,76,99]
total = 0
for x in marks:
    total += x
    average = total/len(marks)
print(average)
```
Or
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