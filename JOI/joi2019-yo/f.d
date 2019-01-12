void main() {
	auto N = ri;
	auto A = readAs!(int[]);
	int[] S;
	foreach(i; 0..N) {
		S = S ~ i.repeat(A[i]).array;
	}
	ulong fact(ulong n) {
		if(n == 0) return 1;
		else return n * fact(n-1);
	}
	ulong e = A.map!(i => fact(i)).reduce!((a, b) => a*b);
	ulong cnt;
	do {
		//S.writeln;
		int last = S.front;
		bool ok = true;
		foreach(i; S[1..$]) {
			if(abs(last - i) <= 1) {
				ok = false;
				break;
			}
			last = i;
		}
		if(ok) {
			cnt = (cnt + e) % 10007;
			//writeln("OK!!!!!!!!!!!!!");
		}
	} while(nextPermutation(S));
	cnt.writeln;
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
