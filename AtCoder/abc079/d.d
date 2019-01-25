void main() {
	auto ip = readAs!(int[]), H = ip[0], W = ip[1];
	auto c = readMatrix!int(10, 10);
	auto A = readMatrix!int(H, W);

	foreach(k; 0..10) foreach(i; 0..10) foreach(j; 0..10) {
		if(c[i][j] > c[i][k] + c[k][j]) c[i][j] = c[i][k] + c[k][j];
	}
	ulong res;
	foreach(i; A) foreach(j; i) {
		if(j != -1) res += c[j][1];
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
