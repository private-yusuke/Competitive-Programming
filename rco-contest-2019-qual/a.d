void main() {
	auto N = ri;
	alias Pair = Tuple!(int, "y", int, "x");
	Pair[] pairs;
	foreach(i; 0..N) {
		auto ip = readAs!(int[]), X = ip[0], Y = ip[1];
		pairs ~= Pair(Y, X);
	}
	
	bool[] visited = new bool[](N);
	visited[0] = true;
	
	0.writeln;
	foreach(i; 0..N-1) {
		auto p = pairs[i];
		float m = float.max;
		ulong mp = ulong.max;
		foreach(j; 0..N) {
			if(visited[j]) continue;
			auto v = pairs[j];
			if(mp == ulong.max) {
				mp = j;
				m = (p.y - v.y)^^2 + (p.x - v.x)^^2;
				continue;
			}
			auto cost = (p.y - v.y)^^2 + (p.x - v.x)^^2;
			if(cost < m) {
				mp = j;
				m = cost;
			}
		}
		visited[mp] = true;
		mp.writeln;
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

double rd() {
	return readAs!double;
}

string rs() {
	return readln.chomp;
}
