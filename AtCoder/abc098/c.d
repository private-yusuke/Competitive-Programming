void main() {
	auto N = ri;
	auto S = rs;
	ulong res = ulong.max;
	auto A = new int[](N);

	// i番目含め左から今までのWの個数
	A[0] = S[0] == 'W';
	foreach(i; 1..N) A[i] = S[i] == 'W' ? A[i-1]+1 : A[i-1];

	// i番目含め左から今までのEの個数
	// C[i] = (i+1) - A[i];
	// 下二行はどちらも同じ結果をもつ

	//auto C = iota(1, N+1).map!(a => a - A[a-1]).array;
	// auto C = iota(N).map!(a => (a+1) - A[a]).array;
	auto C = (int n) {
		return n+1 - A[n];
	};

	foreach(i; 0..N) {
		ulong tmp;
		tmp += C(N-1) - C(i); // リーダーより右でEを向いている人の数
		tmp += i < 1 ? 0 : A[i-1]; // リーダーより左でWを向いている人の数
		res = min(res, tmp);
	}
	res.writeln;
}

// ===================================

import std.stdio;
import std.string;
import std.conv;
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