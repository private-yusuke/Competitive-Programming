void main() {
	auto N = ri;
	auto A = readAs!(long[]);
	auto B = readAs!(long[]);
	ulong[] nen;
	auto give = new bool[](N);
	foreach(i, v; A) {
		if(v < B[i]) nen ~= i;
		if(v > B[i]) give[i] = true;
	}
	auto used = new bool[](N);
	foreach(ni; nen) {
		auto nv = B[ni] - A[ni];
		bool flag = false;
		foreach(i; 0..N) {
			if(give[i] == true) {
				auto ad = min(A[i] - B[i], nv);
				if(ad == A[i] - B[i]) {
					give[i] = false;
				}
				A[i] -= ad;
				nv -= ad;
				used[i] = true;
				used[ni] = true;
			}
			if(nv == 0) {
				flag = true;
				break;
			}
		}
		if(!flag) {
			writeln("-1");
			return;
		}
	}
	used.count!"a".writeln;
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
