N = int(input())
res = 0
for i in range(1, N):
	for j in range(i+1, N):
		res = res + i + j

print(res)