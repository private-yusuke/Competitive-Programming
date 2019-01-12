void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1], D = ip[2];
	auto c = readMatrix!char(N, M);
	
	int[] dy = [0, 1], dx = [1, 0];
	ulong cnt;
	foreach(i; 0..N) foreach(j; 0..M) {
		if(c[i][j] == '#') continue;
		foreach(k; 0..2) {
			foreach(a; 0..D) {
				auto y = i + dy[k]*a, x = j + dx[k]*a;
				//writefln("(%d, %d)", y, x);
				if(0 <= y && y < N && 0 <= x && x < M && c[y][x] == '.') {
					if(a == D-1) cnt++;
				} else break;
			}
		}
	}
	cnt.writeln;
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
