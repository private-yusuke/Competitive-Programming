void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];

	auto arr = new int[][](N);

	foreach(i; 0..M) {
		auto ip2 = readAs!(int[]), A = ip2[0], B = ip2[1];
		arr[A-1] ~= B-1;
		arr[B-1] ~= A-1;
	}
	alias Pair = Tuple!(int, "edge", int, "cnt");
	auto visited = new bool[](N);
	auto res = new int[](N);
	Pair[] queue = [Pair(0, 0)];
	while(queue != []) {
		auto p = queue.front;
		queue.popFront;
		debug writeln(p);

		foreach(i; arr[p.edge]) {
			if(!visited[i]) {
				visited[i] = true;
				res[i] = p.edge+1;
				queue ~= Pair(i, p.cnt+1);
			}
		}
	}
	writeln("Yes");
	res[1..$].each!writeln;
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