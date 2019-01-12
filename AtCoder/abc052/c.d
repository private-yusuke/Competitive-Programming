void main() {
	auto N = ri;
	if(N == 1) {
		writeln(1);
		return;
	}
	auto arr = generate_prime_list(N);
	ulong[ulong] m;
	foreach(i; 1..N+1) {
		foreach(j; arr) {
			while(i % j == 0) {
				m[j]++;
				i /= j;
			}
		}
		if(arr.canFind(i)) m[i]++;
	}
	ulong mod = 1000000007;
	m.values.map!(i => i + 1).reduce!((i, j) => (i * j) % mod).writeln;
}

ulong fact(ulong n) {
	if(n == 1) return 1;
	else return n * fact(n-1);
}

ulong[] generate_prime_list(T)(T N) if(isIntegral!T) {
	ulong[] prime_list = [2];
	bool not_prime = false;
	foreach(i; 3..N.to!ulong+1) {
		foreach(j; prime_list) {
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

// ===================================

import std.stdio;
import std.string;
import std.functional;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.container;
import std.bigint;
import std.numeric;
import std.conv;
import std.typecons;
import std.uni;
import std.ascii;
import std.bitmanip;
import core.bitop;

T readAs(T)() if (isBasicType!T) {
	return readln.chomp.to!T;
}
T readAs(T)() if (isArray!T) {
	return readln.split.to!T;
}

T[][] readMatrix(T)(uint height, uint width) if (!isSomeChar!T) {
	auto res = new T[][](height, width);
	foreach(i; 0..height) {
		res[i] = readAs!(T[]);
	}
	return res;
}

T[][] readMatrix(T)(uint height, uint width) if (isSomeChar!T) {
	auto res = new T[][](height, width);
	foreach(i; 0..height) {
		auto s = rs;
		foreach(j; 0..width) res[i][j] = s[j].to!T;
	}
	return res;
}

int ri() {
	return readAs!int;
}

double rd() {
	return readAs!double;
}

string rs() {
	return readln.chomp;
}
