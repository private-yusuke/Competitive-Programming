O = input()
E = input()
res = ""

for i in range(len(E)):
	res += O[i]
	res += E[i]

if len(O) != len(E):
	res += O[-1]

print(res)