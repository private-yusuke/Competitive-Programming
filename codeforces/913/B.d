void main() {
	auto N = ri;
	int[][] tree = new int[][](N+3, 0);
	//foreach(i; 2..N+2) tree[i] = [];
	foreach(i; 2..N+1) {
		auto p = ri;
		tree[p] ~= i;
	}
	ulong k;
	int[][] que;
	que = [[],[]];
	que[0] ~= 1;
	bool flag = true;
	while(que[k%2] != []) {
		auto p = que[k%2].front;
		que[k%2].popFront;
		ulong cnt;
		bool ok = true;
		foreach(i; tree[p]) {
			que[(k+1)%2] ~= i;
			debug writefln("%s %s %s", tree[i], [], tree[i] == []);
			if(tree[i] == []) cnt++;
			else ok = false;
		}
		if((!ok && cnt == 0) || cnt != 0 && cnt < 3) flag = false;
		k++;
	}
	writeln(flag ? "Yes" : "No");
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
