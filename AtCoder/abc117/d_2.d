void main() {
	auto ip = readAs!(ulong[]), N = ip[0], K = ip[1];
	auto A = readAs!(ulong[]);
	
	auto c = new ulong[](64);
	foreach(v; A) foreach(i; v.bitsSet) c[i]++;
	debug c.writeln;
	ulong res;
	if(K == 0) {
		writeln(A.sum);
		return;
	}
	foreach(i; 0..K.log2.ceil.to!ulong) {
		if(!(K & (1UL << i))) continue;
		ulong X = K;
		X &= ~(1UL << i);
		foreach(j; 0..i) {
			if(c[j] > N-c[j]) {
				X &= ~(1UL << j);
			} else X |= (1UL << j);
		}
		ulong tmp;
		foreach(v; A) {
			tmp += v ^ X;
		}
		// debug writefln("%b", X);
		debug tmp.writeln;
		res = max(res, tmp);
	}
	ulong tmp;
	foreach(v; A) {
		tmp += v ^ K;
	}
	debug tmp.writeln;
	res = max(res, tmp);
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
