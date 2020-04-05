void main() {
	auto a = readAs!(int[]);
	auto arr = a.sum.iota.array;
	alias Pair = Tuple!(int, "y", int, "x");
	bool ok(int y, int x) {
		auto T = new bool[][](3, 3);
		foreach(j, v; a) {
			foreach(k; 3-v..3) T[k][j] = true;
		}
		//T.writeln;
		return T[y][x];
	}
	int[][] gen(int[] t) {
		auto T = new int[][](3, 3);
		foreach(ref v; T) v[] = int.max;
		ulong k;
		foreach(i; 0..3) foreach(j; 0..3) {
			if(ok(i, j)) {
				T[i][j] = t[k];
				k++;
			}
		}
		return T;
	}
	ok(1, 1);
	bool ok2(int[][] arr, int i, int j) {
		//debug arr.writeln;
		if(arr[i][j] == int.max) return true;
		bool flag = true;
		if(i+1 < 3) {
			if(arr[i+1][j] > arr[i][j]) flag = false;
		}
		if(j+1 < 3) {
			if(arr[i][j+1] < arr[i][j]) flag = false;
		}
		return flag;
	}
	ulong res;
	do {
		bool flag = true;
		auto T = gen(arr);
		//debug T.each!writeln;
		foreach(i; 0..3) foreach(j; 0..3) {
			if(!ok2(T, i, j)) flag = false;
			//else debug writefln("%s %d %d", T, i, j);
		}
		if(flag) {
			res++;
			debug T.each!writeln;
		}
	} while(nextPermutation(arr));
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