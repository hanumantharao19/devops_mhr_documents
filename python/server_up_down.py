logs = ["login", "logout", "login", "download", "login", "upload"]

frequency = {}
for action in logs:
    frequency[action] = frequency.get(action, 0) + 1

print("Log Frequency:")
for key, val in frequency.items():
    print(f"{key}: {val}")