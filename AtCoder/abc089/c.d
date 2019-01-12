import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.math;

void main() {
	auto N = readln.chomp.to!int;
	auto a = ['M': 0, 'A': 1, 'R': 2, 'C': 3, 'H': 4];
	auto b = new ulong[](5);
	foreach(_; 0..N) {
		auto c = readln.chomp[0];
		if(c in a) b[a[c]]++;
	}
	auto A = [0, 0, 0, 0, 0, 0, 1, 1, 1, 2];
	auto B = [1, 1, 1, 2, 2, 3, 2, 2, 3, 3];
	auto C = [2, 3, 4, 3, 4, 4, 3, 4, 4, 4];
	ulong res;
	foreach(i; 0..10) {
		 res += b[A[i]] * b[B[i]] * b[C[i]];
	}
	res.writeln;
}

// M A R C H
