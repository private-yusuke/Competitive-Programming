void main() {
	auto N = ri;
	alias Pair = Tuple!(int, "u", int, "v", int, "w");
	Pair[] pairs;
	Pair[][long] next;
	foreach(i; 0..N-1) {
		auto ip = readAs!(int[]), u = ip[0], v = ip[1], w = ip[2];
		pairs ~= Pair(u-1, v-1, w);
		pairs ~= Pair(v-1, u-1, w);
		next[u-1] ~= Pair(u-1, v-1, w);
		next[v-1] ~= Pair(v-1, u-1, w);
	}
	auto visitable = new bool[](N);
	auto visited = new bool[](N);
	visitable[0] = true;
	long[] queue = [0];
	
	while(queue != []) {
		long i = queue.front;
		queue.popFront;
		if(visited[i]) continue;
		visited[i] = true;
		//i.writeln;
		
		foreach(v; next.get(i, [])) {
			//v.writeln;
			if(((visitable[i] ? 0 : 1) + v.w) % 2 == 0) visitable[v.v] = true;
			else visitable[v.v] = false;
			if(!visited[v.v]) queue ~= v.v;
		}
	}
	//visitable.writeln;
	visitable.map!(i => i ? 0 : 1).each!writeln;
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
