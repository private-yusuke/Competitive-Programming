ulong pow_mod(ulong n, ulong k, ulong m) {
	if(k==0) return 1;
	else if(k & 1) return pow_mod(n, k-1, m) * n % m;
	else {
		ulong t = pow_mod(n, k>>1, m);
		return t * t % m;
	}
}