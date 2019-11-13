ok = False
n = int(input())
for i in range(2, n):
	if n % i == 0:
		ok = True

print("Yes" if ok else "No")