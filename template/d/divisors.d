ulong[] getDivisors(ulong N) { // assumeSorted できる
	if(N == 0) return [];
	if(N == 1) return [1];
	ulong[] lower_part, upper_part;
	foreach(i; 1..N.to!real.sqrt.ceil.to!ulong) {
		if(N % i == 0) {
			lower_part ~= i;
			upper_part ~= N / i;
		}
	}
	upper_part.reverse();
	if(N.to!real.sqrt.to!ulong ^^ 2 == N) return lower_part ~ N.to!real.sqrt.to!ulong ~ upper_part;
	else return lower_part ~ upper_part;
}