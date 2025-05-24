## if, else, and elif ###
### 1) if condition is Ture ####
```
exam = True
if exam: 
    print("I have pased my exam")
else:
    print("i have failed exam")

```
## 2) if condtion is False ###
```
exam = False
if exam: 
    print("I have pased my exam")
else:
    print("i have failed exam")
```
## 3) if and else
```
list = ["hanu","mahesh","surehs","ramesh"]
if "hanu" in list:
    print("Element is available in the list")
else:
    print("Element is  not  available in the list")
```

## 4) if ,elif and else
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
# 5 chekc ngix and httpd service is running or not 
```
service = input("Enter service name (nginx/httpd): ")

if service == "nginx":
    print("Nginx is a web server. It is running.")
elif service == "httpd":
    print("Apache HTTP Server is running.")
else:
    print("Service not recognized or not running.")
```
# 6 Determine cloud platform experience
cloud = input("Enter your cloud platform (aws/gcp/azure): ")

if cloud == "aws":
    print("AWS is the most popular cloud platform.")
elif cloud == "gcp":
    print("GCP is good for for its ML/AI tools.")
elif cloud == "azure":
    print("Azure well with enterprise software.")
else:
    print("Please enter a valid cloud platform.")
# 7 Check eligibility for placement
```
cgpa = float(input("Enter your CGPA: "))

if cgpa >= 9:
    print("Eligible for Google, Amazon, Microsoft, etc.")
elif cgpa >= 7:
    print("Eligible for TCS, Infosys, Capgemini, etc.")
else:
    print("Focus on internships and upskilling.")
```
# 8  Dynamic tagging based on release
```
commit_message = input("Enter commit message: ")

if "release" in commit_message:
    print("Triggering release pipeline...")
elif "fix" in commit_message:
    print("Triggering hotfix pipeline...")
else:
    print("Triggering standard CI build.")
```
# 9 Basic login simulation
username = input("Enter username: ")
password = input("Enter password: ")

if username == "admin" and password == "admin@123":
    print("Login successful!")
else:
    print("Invalid credentials.")