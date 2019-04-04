void main() {
	auto Q = ri;
	auto arr = generate_prime_list(100000);
	bool[] arr2 = new bool[](100001);
	foreach(i; 1..100001) {
		if(arr[i] && arr[(i+1)/2]) arr2[i] = true;
	}
	
	ulong[] vl = new ulong[](100001);
	foreach(v; 1..100001) {
		if(arr2[v]) vl[v] = vl[v-1] + 1;
		else vl[v] = vl[v-1];
	}
	
	//debug writefln("%(%d %)", vl);
	foreach(i; 0..Q) {
		auto ip = readAs!(int[]), l = ip[0], r = ip[1];
		writeln(vl[r] - vl[l-1]);
	}
	//debug foreach(i, v; arr) writefln("%d: %s", i, v);
}

bool[] generate_prime_list(T)(T N) if(isIntegral!T) {
	bool[] prime_list = new bool[](N+1);
	prime_list[] = true;
	prime_list[0] = prime_list[1] = false;
	foreach(i; 2..N+1) {
		if(prime_list[i]) {
			foreach(j; iota(i*2, N+1, i)) {
				prime_list[j] = false;
			}
		}
	}
	return prime_list;
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
