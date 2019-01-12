void main() {
	auto ip = readAs!(int[]), A = ip[0], B = ip[1], C = ip[2], X = ip[3], Y = ip[4];
	int x = X, y = Y;
	int res;
	if(A <= C*2-B) {
		res += A*X;
		X = 0;
	} else {
		res += C*Y*2;
		X -= Y;
		Y = 0;
	}
	//"%d %d".writefln(X, Y);

	/*if(X > 0) res += A*X;
	if(Y > 0) {
		if(B < C*2-A) {
			res += B*Y;
			Y = 0;
		} else {
			res += C*X*2;
			Y = 0;
		}
	}*/
	if(X > 0) res += min(A*X, 2*C*max(X, 0));
	if(Y > 0) res += min(B*Y, 2*C*max(Y, 0));

	int res2;
	if(B <= C*2-A) {
		res2 += B*y;
		y = 0;
	} else {
		res2 += C*x*2;
		y -= x;
		x = 0;
	}

	if(x > 0) res2 += min(A*x, 2*C*max(x, 0));
	if(y > 0) res2 += min(B*y, 2*C*max(y, 0));
	min(res, res2).writeln;
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
