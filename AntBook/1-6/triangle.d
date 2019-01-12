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

/*
1:
	5
	2 3 4 5 10
	==>	12
2:
	4
	4 5 10 20
	==>	0
*/

void main() {
	auto n = ri;
	auto a = readAs!(int[]);
	int res = 0;
	foreach(i; 0..n) foreach(j; i+1..n) foreach(k; j+1..n) {
		auto s = a[i] + a[j] + a[k];
		auto r = max(a[i], a[j], a[k]);
		auto b = s - r;
		if(r < b) res = max(res, s);
	}
	res.writeln;
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