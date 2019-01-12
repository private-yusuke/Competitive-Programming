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

void main() {
	auto X = rd, Y = rd, L = rd;
	if(Y >= 0 && X == 0) ceil(abs(Y / L)).to!int.writeln;
	else if(Y >= 0) (ceil(abs(Y / L)) + 1 + ceil(abs(X) / L)).to!int.writeln;
	else (1 + ceil(abs(X) / L) + 1 + ceil(abs(Y) / L)).to!int.writeln;
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