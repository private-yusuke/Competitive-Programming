void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	int[] arr;
	foreach(i; 0..N) {
		auto A = ri;
		arr ~= A;
	}
	int[] m = arr.dup;
	
	int[][] S = new int[][](M, N);
	foreach(k; 0..M) {
		S[k][0] = arr[0] == k+1;
		foreach(i; 0..N-1) {
			S[k][i+1] = S[k][i] + (arr[i+1] == k+1 ? 1 : 0);
		}
	}
	ulong res = ulong.max;
	do {
		if(m.uniq.array.length == M) {
			ulong cnt;
			foreach(i, v; arr) {
				if(v != m[i]) cnt++;
			}
			res = min(res, cnt);
		}
	} while(nextPermutation(m));
	res.writeln;
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
