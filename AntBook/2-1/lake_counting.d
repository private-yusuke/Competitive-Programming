import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.conv;
import std.typecons;
import std.uni;
import std.ascii;
import std.bitmanip;
import core.bitop;

int n, m;
char[][] table;

void main() {
	n = ri;
	m = ri;
	int count;
	table = readMatrix!char(n, m);
	foreach(i; 0..n) foreach(j; 0..m) {
		if(table[i][j] == 'W') {
			dfs(i, j);
			count++;
		}
	}
	count.writeln;
}

void dfs(int x, int y) {
	table[x][y] = '.';
	foreach(i; -1..2) foreach(j; -1..2) {
		auto dx = x + i, dy = y + j;
		if(0 <= dx && n > dx && 0 <= dy && m > dy && table[dx][dy] == 'W')
			dfs(dx, dy);
	}
}

// ===================================

T readAs(T)() if (isBasicType!T) {
	return readln.chomp.to!T;
}
T readAs(T)() if (isArray!T) {
	return readln.split.to!T;
}

T[][] readMatrix(T)(uint height, uint width) if (isBasicType!T) {
	auto res = new T[][](height, width);
	foreach(i; 0..height) {
		res[i] = readAs!(T[]);
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