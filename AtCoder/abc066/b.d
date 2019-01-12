import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.conv;

void main() {
	auto S = readln.chomp;
	S.check.writeln;
}

int check(string s) {
	if(s.length & 1) s.popBack();
	else { s.popBack; s.popBack; }
	while(true) {
		if(s[0..$ / 2] == s[$ / 2..$])
			return s.length.to!int;
		else { s.popBack; s.popBack; }
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