void main() {
	auto N = ri;
	auto L = readAs!(int[]);
	L.sort();
	ulong ans;
	while(N > 1) {
		int mii1 = 0, mii2 = 1;
		if(L[mii1] > L[mii2]) swap(mii1, mii2);

		foreach(i; 2..N) {
			if(L[i] < L[mii1]) {
				mii2 = mii1;
				mii1 = i;
			} else if(L[i] < L[mii2]) {
				mii2 = i;
			}
		}

		auto t = L[mii1] + L[mii2];
		ans += t;

		if(mii1 == N - 1) swap(mii1, mii2);
		L[mii1] = t;
		L[mii2] = L[N - 1];
		N--;
	}

	ans.writeln;
}

// ===================================

import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
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