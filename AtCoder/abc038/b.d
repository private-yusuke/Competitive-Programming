import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.conv;

void main() {
	auto d1 = readAs!(int[]);
	auto d2 = readAs!(int[]);

	if(d1[0] == d2[0] || d1[0] == d2[1] || d1[1] == d2[0] || d1[1] == d2[1]) "YES".writeln;
	else "NO".writeln;
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