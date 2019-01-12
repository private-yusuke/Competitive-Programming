void main() {
	int[] arr;
	arr ~= 1;
	foreach(i; 2..1001) {
		auto a = i;
		auto b = a;
		auto k = 2;

		a *= a;
		while(a <= 1000) {
			arr ~= a;
			k++;
			a = b^^k;
		}
	}
	auto X = ri;
	while(true) {
		if(arr.canFind(X)) {
			X.writeln;
			return;
		}
		X--;
	}
}

// ===================================

import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
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

T[] deepcopy(T)(T[] a) {
	static if(isArray!T) {
		T[] res;
		foreach(i; a) {
			res ~= deepcopy(i);
		}
		return res;
	} else {
		return a.dup;
	}
}