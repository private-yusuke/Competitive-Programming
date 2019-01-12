import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.conv;

void main() {
	auto c = readMatrix!int(3, 3);
	(check(c) ? "Yes" : "No").writeln;
}

bool check(int[][] a) {
	return a[0][0] == a[0][1] + a[1][0] - a[1][1]
		&& a[1][0] == a[1][1] + a[2][0] - a[2][1]
		&& a[0][1] == a[0][2] + a[1][1] - a[1][2]
		&& a[1][1] == a[1][2] + a[2][1] - a[2][2];
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