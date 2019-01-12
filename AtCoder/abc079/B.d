import std.stdio, std.conv, std.string, std.bigint;

void main() {
	int input = to!int(chomp(readln()));
	writeln(lucas(input));
}

BigInt lucas(int n) {
	if(n == 0) return BigInt(2);
	if(n == 1) return BigInt(1);
	
	BigInt a = 2, b = 1, c = 3;
	for(int i = 2; i <= n; i++) {
		c = a + b;
		a = b;
		b = c;
	}
	return c;
}
