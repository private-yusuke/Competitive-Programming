void main() {
	auto ip = readAs!(ulong[]), N = ip[0], K = ip[1];
	auto A = readAs!(ulong[]);
	ulong[ulong] bits;
	foreach(i; 0..64) bits[i] = 0;
	foreach(i; A) {
		auto arr = i.bitsSet;
		debug arr.writeln;
		foreach(j; arr) bits[j]++;
	}
	debug bits.writeln;
	debug writefln("k: %b", K);
	debug writefln("%(%.6b %)", A);
	bool[ulong] visited;
	foreach(i; 0..64) visited[i] = false;
	
	ulong k = K;
	while(k != 0) {
		auto a = k.bitsSet.array.back;
		if(!visited[a]) {
			visited[a] = true;
			if(N / 2 >= bits[a]) {
				foreach(ref v; A) v ^= (1UL << a);
				k -= (1UL << a);
				debug writefln("k: %d, a: %d", k, a);
				continue;
			}
		}
		k = (1UL << a) - 1;
		debug writefln("k: %d, here %d", k, a);
	}
	debug writefln("%(%.6b %)", A);
	A.sum.writeln;
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
