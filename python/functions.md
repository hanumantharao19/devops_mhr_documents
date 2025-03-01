### functions concept ####

## 1) print the input value by using function

```
def input_number():
     return input("enter your number:")
result = input_number()
print(result)
print(type(result))
```
## 2) add two numbers 
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
## 3)  Local and global varaiables
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
## 4)Find even and odd numbers in the give number range
```
def even_odd_number(numbers):
   even_numbers = [ x for x in numbers if x % 2 == 0 ]
   odd_numbers = [ y for y in numbers if y % 2 != 0 ]
   return even_numbers,odd_numbers
number_list = list(range(1,21))
even ,odds = even_odd_number(number_list)
print(even)
print(odds)
```
## 5) calculate the salary for one year
```
def salary_of_employee(months):
   return int(input("enter salry per month:"))*months
total_salary = salary_of_employee(30)
print(total_salary)

```
## 6) multiplication
```
def multiply_values(list):
    multiplied_values = []
    for x in list:
        multiplied_values.append(x*2)
    return multiplied_values
result = multiply_values([10,20,30,40])
print(result)
```
## 7) print the name and house by calling the main function

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
or
```
def main():
    name,house = get_student()
    print(f"{name} form {house}")

def get_student():
    name = input("Name:")
    house =  input("House:")
    return name, house

if __name__ == "__main__":
     main()
```
or
```
def main():
    student = get_student()
    print(f"{student[0]}form {student[1]}")

def get_student():
    name = input("Name:")
    house =  input("House:")
    return (name, house)

if __name__ == "__main__":
     main()
```
or
```
def main():
    student = get_student()
    print(f"{student['name']} form {student['house']}")

def get_student():
    student  = {}
    student["name"]= input("name: ")
    student["house"] = input("house: ")
    return student

if __name__ == "__main__":
     main()
```
or

```
def main():
    student = get_student()
    print(f"{student['name']} form {student['house']}")

def get_student():
   
    name = input("name: ")
    house = input("house: ")
    return { "name": name,"house": house }

if __name__ == "__main__":
     main()
```