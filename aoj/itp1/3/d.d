void main() {
	auto ip = readAs!(int[]), a = ip[0], b = ip[1], c = ip[2];
	auto div = getDivisors(c).assumeSorted;
	auto u = div.lowerBound(b+1);
	auto l = div.lowerBound(a);
	debug u.writeln;
	debug l.writeln;
	debug div.writeln;
	writeln(u.length - l.length);
}

ulong[] getDivisors(ulong N) {
	if(N == 0) return [];
	if(N == 1) return [1];
	ulong[] lower_part, upper_part;
	foreach(i; 1..N.to!real.sqrt.ceil.to!ulong) {
		if(N % i == 0) {
			lower_part ~= i;
			upper_part ~= N / i;
		}
	}
	upper_part.reverse();
	if(N.to!real.sqrt.to!ulong ^^ 2 == N) return lower_part ~ N.to!real.sqrt.to!ulong ~ upper_part;
	else return lower_part ~ upper_part;
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