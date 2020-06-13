void main() {
	auto N = ri;

	alias Pair = Tuple!(long, "A", long, "B");
	Pair[] pairs;

	foreach(i; 0..N) {
		auto ip = readAs!(long[]), A = ip[0], B = ip[1];
		pairs ~= Pair(A, B);
	}

	auto lb = pairs.dup.sort!((a, b) => a.A < b.A).array;
	auto rb = pairs.dup.sort!((a, b) => a.B < b.B).array;
	lb.writeln;
	rb.writeln;

	if(N % 2 == 0) {
		auto lp = N / 2 - 1;
		auto rp = N - (N / 2 - 1) - 1;
		lb[lp].writeln;
		rb[rp].writeln;

		if(rb[rp].A <= lb[lp].B) writeln((rb[rp].B - lb[lp].A - 1) * 2 + 1);
		else writeln(((rb[rp].B - rb[rp].A) + (lb[lp].B - lb[lp].A) - 2) * 2 + 1);
	} else {
		writeln(lb[N/2].B - lb[N/2].A + 1);
	}
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