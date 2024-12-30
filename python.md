## Built in functions in python
- len
- upper
- lower
- split
- replace
- strip
- format
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
### 6) if and else
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
## 7) if ,elif and else
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

## 8) add two numbers 
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
## 9)  Local and global varaiables
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
## 10 print the letters form the string with loop
```
name = "hanumantharao"
for a in name:
    print(a)
for a in "ramesh":
    print(a)
```
## 11) print the numbers form the list with loop
```
list1 = [1,2,3,4,5,6,7,8]

for x in list1:
    print(x)
```
## 12) print the even numbers for the list
```
# print even numebrs
list1 = [1,2,3,4,5,6,7,8,9,10]
for x in list1:
    if x % 2 == 0:
        print(x)
```
## 13) how to use inner loops
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
## 14) print the numbers form the tuples with loop
```
tuple1 = (1,2,3,4,5,6,7,8,9,10)
for a in tuple1:
    print(a)
```
## 15) Print the numebrs form list with loop
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
## 16) Print the values with while loop
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
## 17) how to use pass,continue and break
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
## 18) how to use range function
```
for number in range(10):
    print(number)


for number in range(5,25):
    print(number)


for number in range(5,25,5):
    print(number)
```
## 19) how to use zip function
```
list1 = ["hanu","haswi","sras"]
list2 = ["guntur","usa","hyd"]
for a in zip(list1,list2):
    print(a)
```
## 19) 





