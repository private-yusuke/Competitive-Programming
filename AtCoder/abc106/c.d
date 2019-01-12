void main() {
	auto S = rs;
	auto K = readAs!ulong;
	ulong z_c;
	bool gotNonZero = false;
	char nonZeroNum;
	if(S[0] != '1') {
		writeln(S[0]);
		return;
	}
	foreach(i; S~' ') {
		if(gotNonZero) {
			if(z_c >= K) writeln(1);
			else writeln(nonZeroNum);
			return;
		}
		if(S[0] == '1') {
			z_c++;
			if(S.length == 1) {
				writeln(1);
				return;
			}
			S = S[1..$];
		} else {
			gotNonZero = true;
			nonZeroNum = S[0];
		}
	}
}

// ===================================

import std.stdio;
import std.string;
import std.functional;
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