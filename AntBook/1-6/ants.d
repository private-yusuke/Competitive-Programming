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
	10
	3
	2 6 7
	==>	4
		8
*/

void main() {
	auto L = ri;
	auto n = ri;
	auto x = readAs!(int[]);
	int resmin, resmax;
	foreach(i; x) {
		resmin = max(resmin, min(L - i, i));
		resmax = max(resmax, L - i, i);
	}
	resmin.writeln;
	resmax.writeln;
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