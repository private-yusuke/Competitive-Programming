void main() {
	auto N = ri;
	auto S = rs;
	if(S.length == 1) {
		writeln(3);
		return;
	}
	bool[] arr;
	ulong index = 0;
	while(index < N - 1) {
		if(S[index] != S[index+1]) {
			arr ~= false;
			if(index == N - 2) arr ~= false;
			index++;
		} else {
			arr ~= true;
			index += 2;
		}	
	}
	ulong res;
	if(arr[0]) res = 6;
	else res = 3;
	const ulong MOD = 1000000007;
	alias Pair = Tuple!(bool, "a", bool, "b");
	foreach(k; 0..arr.length-1) {
		auto t = arr[k], i = arr[k+1];
		if([t, i] == [false, false] || [t, i] == [false, true])
			res = (res * 2) % MOD;
		if([t, i] == [true, true])
			res = (res * 3) % MOD;
		t = i;
	}
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
