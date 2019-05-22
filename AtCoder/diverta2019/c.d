void main() {
	auto N = ri;
	auto arr = N.iota.map!(i => rs).array;
	long cnt, cntA, cntB, both;
	foreach(v; arr) {
		cnt += v.count("AB");
		switch([v.front == 'B' ? 10 : 0, v.back == 'A' ? 1 : 0].sum) {
			case 11:
				both++;
				break;
			case 10:
				cntB++;
				break;
			case 1:
				cntA++;
				break;
			default:
				break;
		}
	}
	if(cntA == 0 && cntB == 0) writeln(cnt + max(0, both - 1));
	else writeln(both + min(cntA, cntB) + cnt);
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
