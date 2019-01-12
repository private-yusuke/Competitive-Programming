import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.conv;
import std.typecons;

void main() {
	auto ip = readAs!(int[]), A = ip[0], B = ip[1];
	bool flag = false;
	foreach(i; A..B+1) {
		foreach(j; i.to!string) {
			if(j == '3') flag = true;
		}
		if(i % 3 == 0) flag = true;
		if(flag) i.writeln;
		flag = false;
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

string rs() {
	return readln.chomp;
}