n = int(input())

a, b, c, d = (0, 0, 0, 1)
if n <= 2: print(0)
else:
	for i in range(n-3):
		a = b
		b = c
		c = d
		d = (a + b + c) % 10007
	print(d)
