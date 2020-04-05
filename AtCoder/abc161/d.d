void main() {
	auto K = ri;
	dchar[] genarr(dchar c) {
		if(c == '0') return ['0', '1'];
		if(c == '9') return ['8', '9'];
		else return [c-1, c, c+1];
	}
	dstring[] arr = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];

	bool comp(dstring a, dstring b) {
		if(a.length < b.length) return true;
		else if(a.length > b.length) return false;
		else return a < b;
	}
	
	while(arr.length < 100001) {
		dstring[] tmparr;
		foreach(d; arr) {
			auto T = genarr(d.back);
			foreach(t; T) {
				tmparr ~= (d ~ t);
			}
		}
		arr ~= tmparr;
		arr = arr.sort!(comp)().uniq.array;
	}
	arr[K-1].writeln;
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