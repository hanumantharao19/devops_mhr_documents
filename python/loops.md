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
list = [1,2,3,4,5,6,7,8]

for x in list:
    print(x)
```
# 3) Print even numbers from a predefined list
```
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

for num in numbers:
    if num % 2 == 0:
        print(num)
```
# 4) Print even numbers with end=" " for single-line output
```
numbers = [10, 15, 20, 40, 60, 80]

for num in numbers:
    if num % 2 == 0:
        print(num, end=" ")

print() 
```
# 5) Print odd numbers from a list (opposite condition)
```
numbers = [10, 15, 13, 17, 20, 40, 34, 40]

for num in numbers:
    if num % 2 != 0:
        print(num, end=" ")

print()
```
# 6) Print even numbers from user input range
```
start = int(input("Enter the starting number: "))
end = int(input("Enter the ending number: "))

for num in range(start, end + 1):
    if num % 2 == 0:
        print(num, end=" ")

print()
```
# 7) pass – Placeholder for future code or empty loop body
```
numbers = [1, 2, 3, 4]

for a in numbers:
    if a % 2 == 0:
        pass  #no operation for even numbers (can be replaced later)
    else:
        print(f"Odd number: {a}")

print("Loop completed successfully.")

```
# 8) continue – Skip current iteration and move to next
```
numbers = [1,2,3,4,5,6,7,8,9,10]
for a in numbers:
    if a == 5:
        continue
    print(a)
```
# 9) break – Exit the loop immediately
```
numbers = [1,2,3,4,5,6,7,8,9,10]
for a in numbers:
    if a == 6:
        break
    print(a)
```
# 10) Using range(stop) – prints numbers from 0 to 9
```
for number in range(10):
    print(number)
```
# 11) Using range(start, stop) – prints numbers from 5 to 24
```
for number in range(5, 25):
    print(number)
```
# 12) Using range(start, stop, step) – prints every 5th number between 5 and 24
```
for number in range(5, 25, 5):
    print(number)
```
# 13) range() in reverse
```
for number in range(10, 0, -1):
    print(number)
```
# 14) How to Use Inner Loops (Nested Loops)
for x in [1, 2, 3]:
    # Inner loop runs for each y
    for y in [10, 20, 30]:
        result = x * y
        print(f"{x} * {y} = {result}")

## 15) create a any table
```
table=4
for a in range(1,11):
    print(f"{table} x {a} = {table*a}")

```
# 16) separate even number in one list and odd number in one list
```
numbers = [10, 20, 35, 45, 55, 60]

even_numbers = []
odd_numbers = []

for a in numbers:
    if a % 2 != 0:   # odd
        odd_numbers.append(a)
    else:            # even
        even_numbers.append(a)

print("Even numbers:", even_numbers)
print("Odd numbers:", odd_numbers)

```





