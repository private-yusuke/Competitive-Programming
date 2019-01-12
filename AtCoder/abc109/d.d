void main() {
	alias Cont = Tuple!(int, "sx", int, "sy", int, "gx", int, "gy");
	auto ip = readAs!(int[]), H = ip[0], W = ip[1];
	auto a = readMatrix!int(H, W);
	ulong cnt;
	Cont[] conts;

	auto dx = [1,0,-1,0], dy = [0,1,0,-1];
	foreach(i; 0..H) {
		foreach(j; 0..W) {
			foreach(k; 0..4) {
				auto ry = i + dy[k], rx = j + dx[k];
				if(0 <= ry && ry < H && 0 <= rx && rx < W &&
					a[i][j]%2 != 0) {
					a[ry][rx]++;
					a[i][j]--;
					cnt++;
					conts ~= Cont(i+1, j+1, ry+1, rx+1);
					continue;
				}
			}
		}
	}
	cnt.writeln;
	conts.each!(i => writefln("%d %d %d %d", i.sx, i.sy, i.gx, i.gy));
}

// ===================================

import std.stdio;
import std.string;
import std.functional;
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