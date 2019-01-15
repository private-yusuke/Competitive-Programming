N = int(input())
A = list(map(int, input().split()))
B = list(map(int, input().split()))

avail = []
need = 0
res = 0
sumA = 0
sumB = 0

for i in range(N):
	sumA += A[i]
	sumB += B[i]
	if A[i] > B[i]:
		avail.append(A[i] - B[i])
	if A[i] < B[i]:
		need += B[i] - A[i]
		res += 1

if sumA < sumB:
	print(-1)

else:
	avail.sort(reverse=True)
	avail.append(0)
	for i in avail:
		if need <= 0:
			print(res)
			break
		res += 1
		need -= i
