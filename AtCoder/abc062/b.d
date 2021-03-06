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
	auto ip = readAs!(int[]), H = ip[0], W = ip[1];
	string[] a = new string[](H);
	foreach(i; 0..H) {
		a[i] = rs();
	}
	'#'.repeat(W + 2).writeln;
	foreach(i; 0..H) {
		'#'.write;
		a[i].write;
		'#'.writeln;
	}
	'#'.repeat(W + 2).writeln;
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