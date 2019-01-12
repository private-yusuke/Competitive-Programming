void main() {
	auto ip = readAs!(uint[]);
	N = ip[0], M = ip[1];
	arr = readMatrix!char(N, M);

	foreach(i; 0..N) foreach(j; 0..M) foreach(k; 0..4) {
		dfs(0, k, i, j);
	}
	tmp.writeln;
}

uint tmp;
uint N, M;
char[][] arr;
auto dx = [1, 0, -1, 0];
auto dy = [0, 1, 0, -1];

void dfs(int i, int d, int y, int x) {
	if(arr[y][x]=='#') return;
	auto rx = x+dx[d], ry = y+dy[d];

	if(0 <= ry && ry < N && 0 <= rx && rx < M) {
		if(arr[ry][rx] != '#') {
			if(i==0) {
				dfs(i, d, ry, rx);
				dfs(i+1, (d+1)%4, ry, rx);
			} else {
				tmp++;
				dfs(i, d, ry, rx);
			}
		}
	}
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