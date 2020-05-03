void main() {
	auto S = rs;
	auto N = S.length;
	auto arr = new int[](N);
	arr[0] = 1;
	foreach(i; 0..N-1) arr[i+1] = (10*arr[i]) % 2019;
	debug arr.writeln;
	int[int] m;
	int tmp = S[$-1] - '0';
	m[tmp]++;
	foreach(i; 0..N) {
		tmp = tmp + arr[i] * (S[$-i-1] - '0');
		debug tmp.writeln;
		tmp %= 2019;
		m[tmp]++;
	}
	ulong res;
	debug m.writeln;
	foreach(v; m.values) res += v * (v-1) / 2;
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