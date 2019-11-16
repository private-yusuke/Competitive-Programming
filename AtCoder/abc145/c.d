void main() {
	auto N = ri;
	double res = 0;
	alias Pair = Tuple!(int, "ind", int, "x", int, "y");
	Pair[] pairs;
	foreach(i; 0..N) {
		auto ip = readAs!(int[]), x = ip[0], y = ip[1];
		pairs ~= Pair(i, x, y);
	}
	ulong cnt;
	do {
		cnt++;
		//writeln(pairs);
		double tmp = 0;
		foreach(i; 0..N-1) {
			auto p1 = pairs[i], p2 = pairs[i+1];
			tmp += dis(p1.x, p2.x, p1.y, p2.y);
		}
		res += tmp;
	} while(nextPermutation(pairs));
	writefln("%.8f", res / fact(N));
}

int fact(int n) {
	if(n == 0) return 1;
	else return fact(n-1) * n;
}
double dis(double x1, double x2, double y1, double y2) {
	return sqrt(pow(x1-x2, 2) + pow(y1-y2, 2));
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