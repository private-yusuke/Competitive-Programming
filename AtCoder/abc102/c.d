void main() {
	auto N = ri;
	auto A = readAs!(int[]);
	long[] arr;
	foreach(i; 0..N) {
		arr ~= A[i] - (i+1);
	}
	arr.sort();
	//arr.writeln;
	long t;
	if(N%2==0) {
		t = (arr[$/2-1] + arr[$/2])/2;
	} else {
		t = arr[$/2];
	}
	//t.writeln;
	long res;
	foreach(i; 0..N) {
		res += abs(arr[i] - t);
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
