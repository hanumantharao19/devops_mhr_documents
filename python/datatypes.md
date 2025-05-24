## 1) Print a Name in Python
```
print("This is Hanumantharao")
```
# 2) How to Comment in Python
```
"""
This is a multi-line comment.
Author: Hanumantharao Medikonda
Location: NRT, Andhra Pradesh
"""
print("This is Hanu")
```
## 3) Python Data Types
```
age = 20                    # int
price = 19.23               # float
name = "Hanu"               # string
are_coming = False          # boolean

print(age)
print(price)
print(name)
print(are_coming)
```

# 7) Type Checking in Python
```
x = 25
y = "Hello"
z = 3.14

print(type(x))  # <class 'int'>
print(type(y))  # <class 'str'>
print(type(z))  # <class 'float'>
```
## 4)  Getting User Input Using input()
```
name = input("What is your name? ")
print("Hello " + name)

```
## 4) Convert Data Types
```
birth_year = input("Enter your birth year: ")
age = 2025 - int(birth_year)
print("Your age is:", age)
```
### 5) Add Two Float Numbers from User Input
```
first_number = float(input("Enter first number: "))
second_number = float(input("Enter second number: "))
sum_result = first_number + second_number
print("Sum result is: " + str(sum_result))
#Note: input function always return string
```
## 6) Basic Math Operators
```
a = 10
b = 3

print("Addition:", a + b)
print("Subtraction:", a - b)
print("Multiplication:", a * b)
print("Division:", a / b)
print("Floor Division:", a // b)
print("Modulus:", a % b)
print("Exponent:", a ** b)
```

# Using += to Add and Assign
```
number = 5 
number += 2 # same as number = number+2
print(number)
```
# Using -= to Subtract and Assign
```
balance = 100
balance -= 25  # same as: balance = balance - 25
print(balance)
```
# Using *= to Multiply and Assign
```
points = 10
points *= 3  # same as: points = points * 3
print("After *= :", points)  # Output: 30
```
# Using /= to Divide and Assign
```
total = 20
total /= 4  # same as: total = total / 4
print(total)  # Output: 5.0
```
# Using //=, %=, **=
```
num = 10
num //= 3  # Floor division
print("After //= :", num)  # Output: 3

num = 10
num %= 3  # Modulus
print("After %= :", num)  # Output: 1

num = 2
num **= 3  # Exponentiation
print("After **= :", num)  # Output: 8
```