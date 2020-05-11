void main() {
	auto ip = readAs!(long[]), N = ip[0], K = ip[1];
	auto A = readAs!(long[]);

	ulong p;
	auto rbt = redBlackTree!long;
	long[] ptrs;
	while(rbt.insert(p)) {
		ptrs ~= p;
		p = A[p] - 1;
	}
	debug rbt.writeln;
	debug ptrs.writeln;
	long k;
	while(ptrs[k] != p) {
		k++;
	}
	auto loopc = ptrs.length - k; //ok
	debug writefln("k: %d, loopc: %d", k, loopc);

	if(K < k) {
		writeln(ptrs[K]+1);
	} else {
		writeln(ptrs[(K - k) % loopc + k] + 1);
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