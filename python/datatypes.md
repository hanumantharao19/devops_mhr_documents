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