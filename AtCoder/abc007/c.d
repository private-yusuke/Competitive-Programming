void main() {
	alias Point = Tuple!(int, "y", int, "x");
	auto ip = readAs!(int[]), R = ip[0], C = ip[1];
	auto ip2 = readAs!(int[]), sy = ip2[0], sx = ip2[1];
	auto ip3 = readAs!(int[]), gy = ip3[0], gx = ip3[1];
	auto c = readMatrix!char(R, C);
	auto history = new bool[][](R, C);
	auto cost = new int[][](R, C);
	cost = cost.map!(i => i.map!(j => j = -1).array).array;
	sy--; sx--; gy--; gx--;
	cost[sy][sx] = 0;
	Point[] stack = [Point(sy, sx)];
	int[] dy = [0, 1, 0, -1], dx = [1, 0, -1, 0];
	while(stack != null) {
		auto p = stack.front;
		stack.popFront;
		if(history[p.y][p.x]) continue;
		history[p.y][p.x] = true;
		foreach(i; 0..4) {
			auto y = p.y + dy[i], x = p.x + dx[i];
			if(0 <= y && y < R && 0 <= x && x < C && c[y][x] != '#') {
				stack ~= Point(y, x);
				if(cost[y][x] == -1) cost[y][x] = cost[p.y][p.x] + 1;
				else cost[y][x] = min(cost[y][x], cost[p.y][p.x] + 1);
			}
		}
	}
	cost[gy][gx].writeln;
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
