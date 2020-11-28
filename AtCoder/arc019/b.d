void main() {
	auto A = rs;
	ulong diff = 0;
	ulong ind;
	foreach(i; 0..A.length/2) {
		auto a = A[i], b = A[$ - i - 1];
		if(a != b) {
			diff++;
			ind = i;
		}
	}
	if(A.length == 1)
		writeln(0);
	else if(diff == 0)
		writeln(25 * (A.length - A.length % 2));
	else if(diff == 1)
		writeln(2 * 24 + 25 * (A.length - 2));
	else writeln(25 * A.length);
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

long rl() {
	return readAs!long;
}

double rd() {
	return readAs!double;
}

string rs() {
	return readln.chomp;
}