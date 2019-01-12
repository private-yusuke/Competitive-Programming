void main() {
	auto arr = generate_prime_list(100000);
	auto c = new int[](100001);
	foreach(i; iota(3, 100000, 2)) {
		if(!arr[i] && !arr[(i+1)/2]) c[i]++;
	}
	foreach(i; 3..100001) c[i] += c[i-1];
	auto Q = ri;
	foreach(_; 0..Q) {
		auto ip = readAs!(int[]), l = ip[0], r = ip[1];
		writeln(c[r]-c[l-1]);
	}
}
bool[] generate_prime_list(T)(T N) if(isIntegral!T) {
	bool[] res = new bool[](N+1);
	foreach(i; 2..N+1) {
		if(!res[i]) for(T j = i + i; j <= N; j += i) {
			res[j] = true;
		}
	}
	return res;
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
