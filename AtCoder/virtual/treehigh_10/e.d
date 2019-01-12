alias Pair = Tuple!(int, "y", int, "x");
int[][] arr;
int H, W;
int[][] history;
Pair[int] order;
void main() {
	auto ip = readAs!(int[]);
	H = ip[0], W = ip[1];
	foreach(i; 0..H) {
		auto A = readAs!(int[]);
		arr ~= A;
		foreach(p, v; A) order[v] = Pair(i, p.to!int);
	}
	
	history = new int[][](H, W);
	foreach(ref i; history) i[] = -1;
	ulong cnt;
	foreach(i; 0..H*W) {
		cnt += dfs(order[i+1]);
	}
	cnt.writeln;
}

int[] dy = [1, 0, -1, 0], dx = [0, 1, 0, -1];
int dfs(Pair p) {
	// writefln("%d, %d", p.y, p.x);
	if(history[p.y][p.x] >= 0) return history[p.y][p.x];
	int res;
	foreach(k; 0..4) {
		auto y = p.y + dy[k], x = p.x + dx[k];
		if(0 <= y && y < H && 0 <= x && x < W && arr[y][x] < arr[p.y][p.x]) {
			res += dfs(Pair(y, x));
		}
	}
	if(res == 0) return history[p.y][p.x] = 1;
	else return history[p.y][p.x] = res;
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
