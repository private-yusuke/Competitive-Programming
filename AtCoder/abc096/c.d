void main() {
	auto ip = readAs!(int[]), H = ip[0], W = ip[1];
	auto s = readMatrix!char(H, W);
	auto dx = [-1, 0, 1, 0];
	auto dy = [0, 1, 0, -1];
	foreach(i; 0..H) foreach(j; 0..W) {
		if(s[i][j] == '#') {
			bool ok = false;
			foreach(k; 0..4) {
				if(i-dx[k] >= 0 && i-dx[k] < H &&
					j-dy[k] >= 0 && j-dy[k] < W &&
					s[i-dx[k]][j-dy[k]] == '#') {
					ok = true;
				}
			}
			if(!ok) {
				"No".writeln;
				return;
			}
		}
	}
	"Yes".writeln;
}

// ===================================

import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
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

T[] deepcopy(T)(T[] a) {
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