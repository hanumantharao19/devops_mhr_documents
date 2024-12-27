## Built in functions in python
- len
- upper
- lower
- split
- replace
- strip
- format
## print the name
```
print('this is hanumantharao')
```
## data types in python
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
## pass the data trhough input function
```
name = input("what is you name?")
print("hello" + name)

# Note: we can add(concatenate) two string in python
```
## Converting data types
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
### convert str to float and float to str
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
### if and else
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
## if ,elif and else
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

## add two numbers 
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
## Local and global varaiables
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

