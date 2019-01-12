void main() {
	auto ip = readAs!(long[]), N = ip[0], X = ip[1];
	
	
	string S = "#";
	string[] Ss;
	foreach(i; 0..N) {
		S = format(".%s#%s.", S, S);
		//S.writeln;
		Ss ~= S;
	}
	
	int[][] arr;
	arr = new int[][](N, 0);
	foreach(i; 0..N) {
		arr[i] ~= 0;
		foreach(k; Ss[i][1..$]) {
			arr[i] ~= arr[i].back + (k == '#' ? 1 : 0);
		}
	}
	//arr.back[X].writeln;
	arr.each!writeln;
	arr.map!(i => i.length).writeln;
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
