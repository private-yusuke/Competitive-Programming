import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	int n = readln.chomp.to!int;
	ulong[] a = new ulong[](max(4, n));
	a[2] = 1;
	foreach(i; 3..n) {
		a[i] = (a[i-1] + a[i-2] + a[i-3]) % 10007;
	}
	a[n-1].writeln;
}


void main()
{
	tribonacci(readln.chomp.to!uint).writeln;
}

ushort tribonacci(uint n) {
	ushort[] a = new ushort[](n);
	a[2] = 1;
	foreach(i; 3..n) {
		a[i] = (a[i-1] + a[i-2] + a[i-3]) % 10007;
	}
	return a[i-1];
}