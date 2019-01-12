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
	readln;
	auto A = readAs!(int[]);
	bool notDividable = false;
	uint count;
	while(!notDividable) {
		foreach(ref i; A) {
			if(i & 1) {
				notDividable = true;
				break;
			}
			else i = i / 2;
		}
		count++;
	}
	(count - 1).writeln;
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