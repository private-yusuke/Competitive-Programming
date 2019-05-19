void main() {
	auto ip = readAs!(int[]), H = ip[0], W = ip[1];

	auto A = readMatrix!char(H, W);
	auto dx = [1, 0, -1, 0], dy = [0, 1, 0, -1];

	ulong cnt;
	debug writeln;
	alias Pair = Tuple!(int, "y", int, "x");
	Pair[] stack1, stack2;

	foreach(y; 0..H) foreach(x; 0..W) {
		if(A[y][x] == '#') stack1 ~= Pair(y, x);
	}

	while(stack1 != [] || stack2 != []) {
		if(stack1 != []) cnt++;
		while(stack1 != []) {
			Pair p = stack1.front;
			stack1.popFront;

			foreach(k; 0..4) {
				auto ry = p.y + dy[k], rx = p.x + dx[k];

				if(0 <= ry && ry < H && 0 <= rx && rx < W && A[ry][rx] == '.') {
					A[ry][rx] = '#';
					stack2 ~= Pair(ry, rx);
				}
			}
		}
		if(stack2 != []) cnt++;
		while(stack2 != []) {
			Pair p = stack2.front;
			stack2.popFront;

			foreach(k; 0..4) {
				auto ry = p.y + dy[k], rx = p.x + dx[k];

				if(0 <= ry && ry < H && 0 <= rx && rx < W && A[ry][rx] == '.') {
					A[ry][rx] = '#';
					stack1 ~= Pair(ry, rx);
				}
			}
		}
	}
	(cnt - 1).writeln;
}


T[] deepcopy(T)(T[] a) {
	import std.traits : isArray;
	static if(isArray!T) {
		T[] res;
		foreach(i; a) {
			res ~= deepcopy(i);
		}
		return res;
	} else {
		return a.dup;
	}
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