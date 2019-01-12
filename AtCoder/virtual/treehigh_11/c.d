void main() {	
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	auto C = readMatrix!char(N, M);
	int[][][] arr = new int[][][](3, N, M);
	char[] m = ['W', 'B', 'R'];
	foreach(k; 0..3) foreach(i; 0..N) {
		if(C[i][0] == m[k]) arr[k][i][0] = 1;
		foreach(j; 1..M) {
			if(C[i][j] == m[k]) arr[k][i][j] = 1 + arr[k][i][j-1];
			else arr[k][i][j] = arr[k][i][j-1];
		}
	}
	ulong res = ulong.max;
	foreach(a; 1..N-1) foreach(b; a+1..N) {
		ulong tmp;
		//writefln("(%d %d)", a, b);
		tmp += C[0..a].map!(i => i.count!(j => j != 'W')).sum;
		tmp += C[a..b].map!(i => i.count!(j => j != 'B')).sum;
		tmp += C[b..$].map!(i => i.count!(j => j != 'R')).sum;
		res = min(res, tmp);
		//res.writeln;
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
