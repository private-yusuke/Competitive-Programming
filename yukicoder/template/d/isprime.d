bool isPrime(ulong n) {
	if(n <= 1) return false;
	else if(n == 2) return true;
	else if(n % 2 == 0) return false;

	foreach(i; iota(3, n.to!double.sqrt.ceil+1, 2)) {
		if(n % i == 0) return false;
	}
	return true;
}