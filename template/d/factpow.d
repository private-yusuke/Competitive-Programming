class COM {
	long[] fact, finv, inv;
	private ulong MAX;
	private ulong MOD;

	this(ulong MAX, ulong MOD) {
		this.MAX = MAX;
		this.MOD = MOD;
		fact = new long[](MAX);
		finv = new long[](MAX);
		inv = new long[](MAX);

		// initialize the arrays
		fact[0] = fact[1] = 1;
		finv[0] = finv[1] = 1;
		inv[1] = 1;
		foreach(i; 2..MAX) {
			fact[i] = fact[i - 1] * i % MOD;
			inv[i] = MOD - inv[MOD%i] * (MOD / i) % MOD;
			finv[i] = finv[i - 1] * inv[i] % MOD;
		}
	}

	ulong nCr(long n, long k) {
		if(n < k) return 0;
		if(n < 0 || k < 0) return 0;
		assert(n < MAX && k < MAX);
		return fact[n] * (finv[k] * finv[n - k] % MOD) % MOD;
	}
	ulong factorial(long n) {
		return fact[n];
	}
}

unittest {
	const ulong MAX = 10000001;
	auto FP = new COM(MAX, 1000000007);

	// ABC145 D - Knight's Sample Input 3
	assert(FP.nCr((999999*2 / 3), 999999 - (999999*2 / 3)) == 151840682);

	// Wolfram Alpha "nCr(1234567, 13) mod 1000000007"
	assert(FP.nCr(1234567, 13) == 233743092);
	// Wolfram Alpha "100000! mod 1000000007"
	assert(FP.factorial(100000) == 457992974);

	// some basic tests
	assert(FP.factorial(0) == 1);
	assert(FP.factorial(1) == 1);
	assert(FP.factorial(2) == 2);
	assert(FP.factorial(3) == 6);

	assert(FP.nCr(0, 0) == 1);
	assert(FP.nCr(1, 0) == 1);
	assert(FP.nCr(0, 1) == 0);
	assert(FP.nCr(1, 1) == 1);
	assert(FP.nCr(6, 1) == 6);
	assert(FP.nCr(5, 2) == 10);
	assert(FP.nCr(-1, 0) == 0);
	assert(FP.nCr(0, -1) == 0);
	assert(FP.nCr(-1, -1) == 0);
}