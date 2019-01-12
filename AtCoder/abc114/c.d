void main() {
	auto N = readAs!ulong;
	
	if(N < 357) {
		writeln(0);
		return;
	}
	gen(N).lowerBound(N + 1).length.writeln;
	
}

auto gen(ulong n) {
	auto t = n.to!string.length;
	
	dchar[][] arr = ["3", "5", "7"].to!(dchar[][]);
	foreach(i; 1..t) {
		auto tmp = arr.dup;
		foreach(p; ['3', '5', '7']) {
			foreach(k; tmp) {
				arr ~= p ~ k;
			}
		}
	}
	return arr.filter!(i => i.dup.sort().uniq.array.length == 3).array.sort().uniq.array.to!(ulong[]).sort();
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
