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

alias Point = Tuple!(int, "x", int, "y");
const INF = int.max;

int n, m;
Point S, G;
char[][] table;
int[][] dtable;
Point[] que;

void main() {
	n = ri, m = ri;
	table = readMatrix!char(n, m);
	dtable = new int[][](n, m);

	bfs().writeln;
}

auto dx = [1, 0, -1, 0];
auto dy = [0, 1, 0, -1];

int bfs() {
	foreach(i; 0..n) foreach(j; 0..m) {
		if(table[i][j] == 'S') S = Point(i, j);
		else if(table[i][j] == 'G') G = Point(i, j);
	}
	foreach(i; 0..n) dtable[i][] = INF;

	que ~= S;
	dtable[S.x][S.y] = 0;

	while(que.length) {
		auto a = que.front;
		que.popFront;
		if(a.x == G.x && a.y == G.y) break;

		foreach(i; 0..4) {
			auto nx = a.x + dx[i], ny = a.y + dy[i];
			if(0 <= nx && n > nx && 0 <= ny && m > ny && table[nx][ny] != '#' && dtable[nx][ny] == INF) {
				que ~= Point(nx, ny);
				dtable[nx][ny] = dtable[a.x][a.y] + 1;
			}
		}
	}
	return dtable[G.x][G.y];
}

// ===================================

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