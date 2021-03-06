void main() {
	auto ip = readAs!(int[]), N = ip[0], K = ip[1];
	auto S = rs.group.array;
	if(S.length == 1) {
		writeln(N);
		return;
	}
	ulong res;
	auto R = S.length - K;
	if(S.back[0] == '1') R++;
	auto upper = S.length;
	auto arr = new ulong[](S.length+1);
	arr[1] = S[0][1];
	foreach(i; 2..S.length+1) arr[i] = arr[i-1] + S[i-1][1];
	debug arr.writeln;
	foreach(i; 0..R) {
		if(S[i][0] == '0') {
			auto r = min(i+2*K, upper);
			debug writefln("%d %d: %d - %d = %d", r, i, arr[r], arr[i], arr[r] - arr[i]);
			res = max(res, arr[r] - arr[i]);
		} else {
			auto r = min(i+2*K+1, upper);
			debug writefln("%d %d: %d - %d = %d", r, i, arr[r], arr[i], arr[r] - arr[i]);
			res = max(res, arr[r] - arr[i]);
		}
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
