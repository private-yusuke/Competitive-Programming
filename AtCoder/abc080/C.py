N = int(input())
F = []
P = []
for i in range(N):
    a = list(map(int, input().split()))
    b = 0
    for j in range(5):
        if(a[j*2] == 0 & a[j*2+1] == 0):
            b += 1
        elif(a[j*2] == 1 & a[j*2+1] == 1):
            b += 2
        else:
            b += 1
    F.append(b)
for i in range(N):
    P.append(list(map(int, input().split()[0:F[i]])))

result = 0;
for i in P:
    result += max(i[1:])

print(result)
