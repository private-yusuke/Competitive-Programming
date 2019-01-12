ulong[] generate_prime_list(T)(T N) if(isIntegral!T) {
	ulong[] prime_list = [2];
	bool not_prime = false;
	foreach(i; 3..N.to!ulong+1) {
		auto p = i.to!float.sqrt.ceil.to!ulong;
		foreach(j; prime_list) {
			if(j > p) break;
			if(i % j == 0) {
				not_prime = true;
				break;
			}
		}
		if(!not_prime) prime_list ~= i;
		not_prime = false;
	}
	return prime_list;
}

/*
int[] prime_list;

void generate_prime_list(int N) {
	prime_list = [2];
	bool not_prime = false;
	foreach(i; 3..N+1) {
		foreach(j; prime_list) {
			if(i % j == 0) {
				not_prime = true;
				break;
			}
		}
		if(!not_prime) prime_list ~= i;
		not_prime = false;
	}
}
*/
