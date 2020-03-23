void main() {
	auto ip = readAs!(int[]), H = ip[0], W = ip[1];
	auto s = readMatrix!char(H, W);
	auto cost = new int[][](H, W);
	foreach(ref v; cost) v[] = -1;
	if(s[0][0] == '#' ) cost[0][0] = 1;
	else cost[0][0] = 0;
	//auto visited = new bool[][](H, W);
	//visited[0][0] = true;
	bool isBlack(int x, int y) {
		if(0 <= x && x <= H && 0 <= y && y <= W) return s[x][y] == '#';
		else return true;
	}

	int dfs(int x, int y) {

		debug writefln("%d %d", x, y);
		if(0 <= x && x <= H && 0 <= y && y <= W) {
			if(cost[x][y] != -1) return cost[x][y];
			//if(visited[x][y]) return cost[x][y];
			auto tmp = min(
				dfs(x-1, y) + (!isBlack(x-1, y) && isBlack(x, y))
				, dfs(x, y-1) + (!isBlack(x, y-1) && isBlack(x, y))
				);
			//visited[x][y] = true;
			return cost[x][y] = tmp;
		}
		return (int.max - 10000);
	}
	dfs(H-1, W-1).writeln;
	debug cost.each!writeln;
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