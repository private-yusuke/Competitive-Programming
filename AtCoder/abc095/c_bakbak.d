void main() {
	auto ip = readAs!(int[]), A = ip[0], B = ip[1], C = ip[2], X = ip[3], Y = ip[4];
	int res;
	auto C_A = 2*C-B;
	auto C_B = 2*C-A;
	if(C_A < A) {
		res += C*2*Y;
		X -= Y;
		Y = 0;
	}
	if(C_B < B && Y > 0) {
		res += C*2*X;
		Y -= max(X, 0);
		X = 0;
	}
	if(X > 0) {
		res += min(2*C*X, A*X);
		
	}
	if(Y > 0) {
		res += min(2*C*Y, B*Y);
	}
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
