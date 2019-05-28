void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	int[][] arr;
	int[] ks;
	foreach(i; 0..M) {
		auto ip2 = readAs!(int[]), k = ip2[0];
		ks ~= k;
		auto s = ip2[1..$].map!(i => i - 1).array;
		arr ~= s;
	}
	auto p = readAs!(int[]);

	ulong d = 0;
	ulong cnt;
	//arr.writeln;
	while(d < (1 << N)) {
		auto b = format(format("%%.%db", N), d).map!(i => i == '1' ? true : false).array;
		
		bool flag = true;

		foreach(i; 0..M) {
			ulong a;
			auto k = ks[i];
			foreach(j; 0..k) {
				auto tmp = arr[i][j];
				if(b[tmp]) a++;
			}
			if(a % 2 != p[i]) flag = false;
		}
		
		if(flag) cnt++;

		d++;
	}
	cnt.writeln;
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