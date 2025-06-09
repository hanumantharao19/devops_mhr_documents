if we want to repesent a group of strings according to particular pattern then we should 
go for RE'
1) Validations
2) Pattern Matching applications
3) syntax and logical analysis

```
import re
count = 0
patteren = re.compile('hanu')
print(patteren)
matcher = patteren.finditer('hanumedikondahanu_hanu')
for match in matcher:
    count +=1
    print(match.start())
print("number of ocrrences:",count)
```
```
import re
count = 0
patteren = re.compile('hanu')
print(patteren)
matcher = patteren.finditer('hanumedikondahanu_hanu')
for match in matcher:
    count +=1
    print('start-{},end-{},group-{}'.format(match.start(),match.end(),match.group()))
print("number of ocrrences:",count)
```
```
import re
count = 0
matcher = re.finditer('hanu','hanumedikondahanu_hanu')
for match in matcher:
    count +=1
    print('start-{},end-{},group-{}'.format(match.start(),match.end(),match.group()))
print("number of ocrrences:",count)
```
# Chracter classes
[abc] #either a or b or c
[^abc] # except a,b and c
[a-z] # any lower case alphabet symbols
[A-Z] # any upper case alphabet symbols
[a-zA-Z] # Any Alphabet symbol
[0-9] # any digit
[^a-zA-Z0-9] # excpet any alpha numeric charachter

```
import re
matcher = re.finditer('[abc]','Hanu1234@Medikonda_#!$')
for match in matcher:
    print(match.start(),match.end(),match.group())
```
```
import re
count = 0
matcher = re.finditer('[^abc]','Hanu1234@Medikonda_#!$')
for match in matcher:
    count +=1
    print(match.start(),match.end(),match.group())
```
```
import re
count = 0
matcher = re.finditer('[a-z]','Hanu1234@Medikonda_#!$')
for match in matcher:
    count +=1
    print(match.start(),match.end(),match.group())
```
```
import re
count = 0
matcher = re.finditer('[a-zA-Z0-9]','Hanu1234@Medikonda_#!$')
for match in matcher:
    count +=1
    print(match.start(),match.end(),match.group())
```
# Predefined Charachter class
\s --> space character
\S --> Except space character
\d --> any digit [0-9]
\D --> excpet any digits[^0-9]
\w --> any word charcter(alphanumeric character)[a-zA-Z0-9]
\W --> excpet any word charcter[^a-zA-Z0-9]
^a ---> strat the string with a
a$ --> end string with a

```
import re
matcher = re.finditer('[\s]','Hanu1234 @Medikonda_#!$')
for match in matcher:
    print(match.start(),match.end(),match.group())
```
```
```
import re
matcher = re.finditer('[\S]','Hanu1234 @Medikonda_#!$')
for match in matcher:
    print(match.start(),match.end(),match.group())
```
```
import re
matcher = re.finditer('[\S]','Hanu1234 @Medikonda_#!$')
for match in matcher:
    print(match.start(),match.end(),match.group())
```
```
import re
matcher = re.finditer('[\w]','Hanu1234 @Medikonda_#!$')
for match in matcher:
    print(match.start(),match.end(),match.group())
```
```
import re
matcher = re.finditer('[\W]','Hanu1234 @Medikonda_#!$')
for match in matcher:
    print(match.start(),match.end(),match.group())
```
```
import re
matcher = re.finditer('a*','Hanu1234 @Medikonda_#!$')
for match in matcher:
    print(match.start(),match.end(),match.group())
```
```
import re
matcher = re.finditer('a{2,3}','aabaabaaab')
for match in matcher:
    print(match.start(),match.end(),match.group())
```
```
import re
matcher = re.finditer('^a','abhay')
for match in matcher:
    print(match.start(),match.end(),match.group())
```
```
import re
matcher = re.finditer('y$','abhay')
for match in matcher:
    print(match.start(),match.end(),match.group())
```

```
import re
m = re.search('hanu','this hanu medikonda fullaname hanumantharao')
if m != None:
  print( "match is available in the first occurence")
else:
  print("match is not available")
```
```
import re
l= re.findall('[0-9]','123hanu456medikonda9')
print(l)
```
```
import re
l= re.sub('\d','#','1hanu4medikond')
print(l)
```
```
import re
l= re.sub('#',r'\\','a#b#k5#9k')
print(l)
```




