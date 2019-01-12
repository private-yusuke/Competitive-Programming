void main() {
	auto ip = readAs!(int[]), A = ip[0], B = ip[1], C = ip[2], X = ip[3], Y = ip[4];
	int res;
	if(2*C-B < A && 2*C*X < X*A) {
		res += 2*C*X;
		Y -= X;
		X = 0;
	}
	if(2*C-A < B && 2*C*Y < Y*B) {
		res += 2*C*Y;
		X -= max(0, Y);
		Y = 0;
	}
	if(X > 0) res += min(A*X, 2*C*max(X, 0));
	if(Y > 0) res += min(B*Y, 2*C*max(Y, 0));
	res.writeln;
}

// ===================================

import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
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
