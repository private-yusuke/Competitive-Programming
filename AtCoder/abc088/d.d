void main() {
	auto ip = readAs!(int[]), H = ip[0], W = ip[1];
	auto s = readMatrix!char(H, W);
	bool[][] visited = new bool[][](H, W);
	alias Pair = Tuple!(int, "y", int, "x", int, "c");
	Pair[] stack = [Pair(0, 0, 0)];
	auto m = s.map!(i => i.map!(j => j == '.' ? 1 : 0).sum).sum;
	int a;
	int[] dx = [1, 0, -1, 0], dy = [0, 1, 0, -1];
	while(stack != []) {
		auto p = stack.front;
		stack.popFront;
		foreach(k; 0..4) {
			auto y = p.y + dy[k], x = p.x + dx[k];
			if(0 <= y && y < H && 0 <= x && x < W
				&& s[y][x] == '.' && !visited[y][x]) {
				stack ~= Pair(y, x, p.c+1);
				visited[y][x] = true;
				if(y == H-1 && x == W-1) {
					a = p.c+1;
					stack = null;
				}
			}
		}
	}
	if(visited[H-1][W-1]) (m - a - 1).writeln;
	else writeln(-1);
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
