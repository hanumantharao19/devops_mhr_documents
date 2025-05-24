
# how to use break in while loop
```
x = 0
while x < 5:
    if x == 2:
     break
    print(x)
    x = x + 1
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

# even numbers stored in even list and odd numbers stored in odd list
a = [1,2,3,4,5,6,7,8,9,10,11,12]

even = []
odd = []

i = 0
while i < len(a):
    if a[i] % 2 == 0:
        even.append(a[i])
    else:
        odd.append(a[i])
    i += 1

print("Even numbers:", even)
print("Odd numbers:", odd)

#  Sum of Digits in a Number

number = int(input("Enter a number: "))
sum_of_digits = 0

while number > 0:
    sum_of_digits += number % 10
    number //= 10

print(f"Sum of digits: {sum_of_digits}")