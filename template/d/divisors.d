ulong[] getDivisors(ulong N) {
	ulong[] res;
	foreach(i; 1..N.to!real.sqrt.ceil.to!ulong) {
		if(N % i == 0) {
			res ~= i;
			res ~= N / i;
		}
	}
	return res;
}
