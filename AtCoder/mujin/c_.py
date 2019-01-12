N, M = map(int, input().split())
arr = []
for i in range(N):
	arr.append(input())

tmp = 0
dx = [1, 0, -1, 0]
dy = [0, 1, 0, -1]


####################

def dfs(i, d, y, x):
	global tmp
	if arr[y][x]=='#': return
	rx = x+dx[d]
	ry = y+dy[d]

	#print("0<={}<{}: {}, 0<={}<{}: {}".format(ry, N, 0<=ry<N, rx, M, 0<=rx<M))

	if 0 <= ry < N and 0 <= rx < M:
		#print(arr[ry][rx])
		if arr[ry][rx]!='#':
			if i==0:
				dfs(i, d, ry, rx)
				dfs(i+1, (d+1)%4, ry, rx)
			else:
				tmp += 1
				#print("{}, {} to {}, {}".format(y, x, ry, rx))
				dfs(i, d, ry, rx)

####################

for i in range(N):
	for j in range(M):
		for k in range(4):
			dfs(0, k, i, j)




print(tmp)