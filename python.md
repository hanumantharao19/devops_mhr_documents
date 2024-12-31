## 1) print the name
```
print('this is hanumantharao')
```
## 2) data types in python
```
age =  20   #int variable
price = 19.23  #float variable
first_name =  "hanu"  #string variable
are_coming = False   # boolean variable
print (age)
print(price)
print(first_name)
print(are_coming)
#Note: python is k  sensitive
```
## 3) pass the data trhough input function
```
name = input("what is you name?")
print("hello" + name)

# Note: we can add(concatenate) two string in python
```
## 4) Converting data types
```
date_of_birth =  input("enter you birth year: ")
age = 2022 - int( date_of_birth )
print(age)
# Note: add and subtraction between int and string not possible
int()   # it is used to convert into integer
float()  # it is used to convert into float
bool()  # it is used to convert into bool
str()  # it is used to convert into string
```
### 5) convert str to float and float to str
```
first_number = input("enter first number:")
second_number = input("enter second number:")
sum = float(first_number) + float(second_number)
print("sum result is “ + str(sum)")
```
Or
```
first_number = float(input("enter first number:"))
second_number = float(input("enter second number:"))
sum = first_number + second_number
print("sum result is “ + str(sum)")

#Note: input function always return string  

```
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

### swap the strings###
names = ["hyderabad","guntur","vijayawada"]
temp = names[0]
names[0] = names[1]
names[1] = temp
print(names)
### Alternative approach
names = ["hyderabad","guntur","vijayawada"]
names[0],names[1] = names[1],names[0]
print(names)

## Sort method###
numbers = [40,20,100,467,500,67,700,86,900]
numbers.sort()  ## it print the numbers in assending orders
print(numbers)

## reverse method##
numbers = [40,20,100,467,500,67,700,86,900]
numbers.reverse()
print(numbers)

### clear the index
list = ["hanu","ramesh","suresh","ganesh"]
list.clear()
print(list)

```
## 8) average the values in the list
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

## 9) find elements in list
```
names = ["hanu","ram","sras","mahesh","suresh"]
print("hanu" in names)
print("hanu" not in names)
```
### 10) if and else
```
exam = True
if exam: 
    print("I have pased my exam")
else:
    print("i have failed exam")


exam = False
if exam: 
    print("I have pased my exam")
else:
    print("i have failed exam")
```
## 11) if and else
```
list = ["hanu","mahesh","surehs","ramesh"]
if "hanu" in list:
    print("Element is available in the list")
else:
    print("Element is  not  available in the list")
```

### 12) elment is available or not with for loop
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

## 13) if ,elif and else
```
job = input("enter your job" )
if job == "electrical":
    print("he or she can able to do electrical work")
elif job == "farming":
     print("He can able to do farming")
elif job == "civil engineer":
     print("He can able to constrck house")
else:
    print("he or she not perfoming electrical work")
```


## 14)  Local and global varaiables
```
a = 100
b = 50
def calculation():
      b = 40
      x = a + b
      y = a - b
      z = a * b
      return  x , y ,z
result = calculation()
print(result)
```
## 15) print the letters form the string with loop
```
name = "hanumantharao"
for a in name:
    print(a)
for a in "ramesh":
    print(a)
```
## 16) print the numbers form the list with loop
```
list1 = [1,2,3,4,5,6,7,8]

for x in list1:
    print(x)
```
## 17) print the even numbers for the list
```
# print even numebrs
list1 = [1,2,3,4,5,6,7,8,9,10]
for x in list1:
    if x % 2 == 0:
        print(x)
```
or
```
# list the even numbers
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
## 18) opend the values
```
list1 = [1, 2, 3]
list2 = [4, 5, 6]

result = []
for i in range(len(list1)):
    result.append(list1[i] + list2[i])

print(result)  # Output: [5, 7, 9]
```

## 19) how to use inner loops
```
for x in [1,2,3]:
   for y in [10,20,30]:
        z = x*y
        print(z)

##    

for x in [1,2,3]:
   for y in [10,20,30]:
        print(x*y)

```
## 20) print the numbers form the tuples with loop
```
tuple1 = (1,2,3,4,5,6,7,8,9,10)
for a in tuple1:
    print(a)
```
## 21) Print the numebrs form list with loop
```
list2 = [(1,2),(3,4),(5,6),(7,8),(9,10)]
for item in list2:
    print(item)

for (a,b) in list2:
    print(a)
    print(b)

list2 = [(1,2,11),(3,4,12),(5,6,13),(7,8,14),(9,10,15)]
for a,b,c in list2:
    print(c)

```
## 22) Print the values with while loop
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
## 23) how to use pass,continue and break
```
#break,continue,pass
# break : breack out the current closest closing loop
# continue: goes to the top of the closest closing loop
# pass: Does Nothing at all
# how to use pass 
x = [1,2,3,4]
for a in x:
    pass
print("script complete successfully")


#how to use continue
x = [1,2,3,4,5,6,7,8,9,10]
for a in x:
    if a == 5:
        continue
    print(a)

# how to use break in for loop
x = [1,2,3,4,5,6,7,8,9,10]
for a in x:
    if a == 6:
        break
    print(a)

# how to use break in while loop

x = 0
while x < 5:
    if x == 2:
     break
    print(x)
    x = x + 1
```
## 24) how to use range function
```
for number in range(10):
    print(number)


for number in range(5,25):
    print(number)


for number in range(5,25,5):
    print(number)
```
## 25) how to use zip function
```
list1 = ["hanu","haswi","sras"]
list2 = ["guntur","usa","hyd"]
for a in zip(list1,list2):
    print(a)
```
## 26) print the input value by using function

```
def input_number():
     return input("enter your number:")
result = input_number()
print(result)
print(type(result))
```
## 27) add two numbers 
```
def addition(a,b):
   print("result:", (a+b))
addition(10,30)
```
or
```
def addition(a,b):
    return (a+b)  
result = addition(10,20)
print(result)
```
or
```
def sum_of_numbers(num1,num2):
    return num1+num2
result = sum_of_numbers(10,20)
print(result)
```
## 28) calculate the salary for one year
```
def salary_of_employee(months):
   return int(input("enter salry per month:"))*months
total_salary = salary_of_employee(30)
print(total_salary)

```
## 29) multiplication
```
def multiply_values(list):
    multiplied_values = []
    for x in list:
        multiplied_values.append(x*2)
    return multiplied_values
result = multiply_values([10,20,30,40])
print(result)
```
## 30) function

```
def main():
     name = get_name()
     house = get_home_name()
     print(f"{name} form {house}")
def get_name():
    return input("name")
def get_home_name():
     return input("home name")
if __name__ == "__main__":
     main()
```








