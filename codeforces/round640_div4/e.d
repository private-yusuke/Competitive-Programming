void main() {
	auto t = ri;
	foreach(T; 0..t) {
		auto n = ri;
		auto a = readAs!(int[]);
		auto arr = new int[](n);
		arr[0] = a[0];
		foreach(i; 1..n) arr[i] = arr[i-1] + a[i];
		int[int] ms, me;

		foreach(v; a) me[v]++;
		foreach(i; 1..n) ms[arr[i]]++;
		foreach(i; 0..n) foreach(j; i..n) {
			if(j - i < 2) continue;
			auto s = arr[j] - arr[i];
			debug writefln("%d, %d => %d", j, i, s);
			if(s <= n) ms[s]++;
		}
		long res;
		debug "=====".writeln;
		debug me.writeln;
		debug ms.writeln;
		foreach(i, v; me) {
			if(i in ms) {
				res += v;
			}
		}
		res.writeln;
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

long rl() {
	return readAs!long;
}

double rd() {
	return readAs!double;
}

string rs() {
	return readln.chomp;
}