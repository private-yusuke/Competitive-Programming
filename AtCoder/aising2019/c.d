void main() {
	auto ip = readAs!(int[]), H = ip[0], W = ip[1];
	auto S = readMatrix!char(H, W);
	alias Pair = Tuple!(ulong, "y", ulong, "x");
	
	int[] dy = [1, 0, -1, 0], dx = [0, 1, 0, -1];
	Pair[] stack;
	foreach(i, iv; S) foreach(j, jv; iv) {
		if(jv == '#') stack ~= Pair(i, j);
	}
	ulong res;
	bool[][] done = new bool[][](H, W);

	//ulong res2;
	while(stack != []) {
		auto p = stack.front;
		stack.popFront;
		if(done[p.y][p.x]) continue;
		Pair[] stack2;
		stack2 ~= Pair(p.y, p.x);
		ulong wh, bl;
		
		while(stack2 != []) {
			auto p2 = stack2.front;
			stack2.popFront;

			foreach(k; 0..4) {
				auto ry = p2.y + dy[k];
				auto rx = p2.x + dx[k];
				if(0 <= ry && ry < H && 0 <= rx && rx < W && S[ry][rx] != S[p2.y][p2.x] && !done[ry][rx]) {
					if(S[ry][rx] == '.') { res++; wh++; }
					else bl++;
					stack2 ~= Pair(ry, rx);
					//visited[ry][rx] = true;
					done[ry][rx] = true;
					//res2++;
					//writefln("%d, %d -> %d, %d", p.y, p.x, ry, rx);
				}
			}
			done[p2.y][p2.x] = true;
		}
		res += wh * bl;
	}
	res.writeln;
	//es2.writeln;
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
