void main() {
	auto ip = readAs!(BigInt[]), N = ip[0], A = ip[1], B = ip[2];
	if((B - A) % 2 == 0) writeln((B - A) / 2);
	else {
		auto x1 = (B - A + 1) / 2, x2 = N + (A - B  + 1) / 2;
		auto l1 = B - x1, l2 = x2 - A;
		const BigInt MAX = BigInt("1000000000000000000000000000000000000");
		writeln(min(
		max(A-1, B-1), max(N-A, N-B),
		l1 > 0 ? l1 : MAX, l2 > 0 ? l2 : MAX
		));
	}
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