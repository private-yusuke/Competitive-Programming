bool[][] g;
bool[] visited;
int N;

int dfs(int v) {
	bool all_visited = true;

	foreach(i; visited) if(!i) all_visited = false;
	if(all_visited) return 1;

	int res;
	foreach(i; 0..N) {
		if(!g[v][i]) continue; // つながってないです
		if(visited[i]) continue; // もう通ったよ？？通れませんが？？

		visited[i] = true; // 通ってみよう
		res += dfs(i); // 次はどっちかな
		visited[i] = false; // 〜ここを通らない世界線を夢見て〜
	}

	return res;
}
void main() {
	auto ip = readAs!(int[]), M = ip[1];
	N = ip[0];
	g = new bool[][](N, N);
	visited = new bool[](N);
	foreach(i; 0..M) {
		auto ip2 = readAs!(int[]), a = ip2[0], b = ip2[1];
		g[a-1][b-1] = g[b-1][a-1] = true;
	}
	visited[0] = true;
	dfs(0).writeln; // 頂点1が始点です
}

// ===================================

import std.stdio;
import std.string;
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