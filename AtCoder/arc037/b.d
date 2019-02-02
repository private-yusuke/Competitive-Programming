void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];

	m = new ulong[][](N);
	foreach(i; 0..M) {
		auto ip2 = readAs!(int[]), u = ip2[0], v = ip2[1];
		m[u-1] ~= v-1;
		m[v-1] ~= u-1;
	}

	visited = new bool[](N);
	ulong res;
	foreach(i; 0..N) {
		if(visited[i]) continue;
		res += dfs(-1, i);
	}
	res.writeln;
}

ulong[][] m;
bool[] visited;

bool dfs(int i, int j) {
	if(!visited[j]) {
		visited[j] = true;
		foreach(k; m[j]) {
			if(k != i) {
				if(!visited[k]) return dfs(j, k.to!int);
				else return false;
			}
		}
	}
	return true;
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
