N, M = map(int, input().split())

arr = []
for i in range(N):
	arr.append(input())
	
dx = [0, 1, 0, -1]
dy = [-1, 0, 1, 0]
tmp = 0

def dfs(i, d, x, y):
	if i == 2: return
	print("0 <= {} < {}: {}, 0 <= {} < {}: {}".format(y, M, 0<=y<M, x, N, 0<=x<N))
	if not(0 <= y < N and 0 <= x < M): return
	#print("{}, {}".format(x, y))
	if arr[x][y]=='#': return
	zx = dx[d]
	zy = dy[d]

	print("rx: {}, ry: {}".format(x+zy, y+zy))

	if 0 <= y+zy < N and 0 <= x+zx < M and arr[y+zy][x+zx]=='.':
		if i == 1:
			global tmp
			print("({}, {}) to ({}, {})".format(x,y,x+zx,y+zy))
			tmp += 1
			dfs(i, d, x+zx, y+zy)
		else:
			dfs(i, d, x+zx, y+zy)
			dfs(i+1, (d+1)%4, x+zx, y+zy)
	
for i in range(N):
	for j in range(M):
		print("{}, {}".format(i, j))
		if arr[i][j] == '#':
			continue
		
		for k in range(4):
			dfs(0, k, j, i)
			
print(tmp)
