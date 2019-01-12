void main() {
	auto ip = readAs!(int[]), H = ip[0], W = ip[1];
	auto c = readMatrix!char(H, W);
	auto m = new int[][](H, W);
	alias Pair = Tuple!(int, "y", int, "x");
	Pair[][] q = [[], []];
	
	int[] dy = [0,1,1,1,0,-1,-1,-1], dx = [1,1,0,-1,-1,-1,0,1];
	foreach(y; 1..H-1) foreach(x; 1..W-1) {
		int cnt;
		foreach(k; 0..8) {
			auto ry = y + dy[k], rx = x + dx[k];
			if(c[ry][rx] == '.') {
				cnt++;
			}
		}
		if(c[y][x] != '.' && c[y][x].to!string.to!int <= cnt) q[0] ~= Pair(y, x);
		m[y][x] = cnt;
	}
	debug m.each!writeln;
	
	ulong p;
	ulong res;
	while(q[p] != []) {
		while(q[p] != []) {
			auto pa = q[p].front;
			q[p].popFront;
			
			foreach(k; 0..8) {
				auto y = pa.y + dy[k], x = pa.x + dx[k];
				m[y][x]++;
				if(c[y][x] != '.' && c[y][x].to!string.to!int == m[y][x]) {
					q[p ^ 1] ~= Pair(y, x);
					c[y][x] = '.';
				}
			}
		}
		p ^= 1;
		res++;
	}
	res.writeln;
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
