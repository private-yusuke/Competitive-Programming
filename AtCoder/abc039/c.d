void main() {
	auto S = rs.map!(a => a == 'W' ? '_' : '-').array;
	int index;
	auto res =  ["Do", "Do", "Re", "Re", "Mi", "Fa", "Fa", "So", "So", "La", "La", "Si"];
	switch(S) {
		case "_-_-__-_-_-__-_-__-_", "-_-__-_-_-__-_-__-_-":
			"Do".writeln;
			break;
		case "_-__-_-_-__-_-__-_-_", "-__-_-_-__-_-__-_-_-":
			"Re".writeln;
			break;
		case "__-_-_-__-_-__-_-_-_":
			"Mi".writeln;
			break;
		case "_-_-_-__-_-__-_-_-__", "-_-_-__-_-__-_-_-__-":
			"Fa".writeln;
			break;
		case "_-_-__-_-__-_-_-__-_", "-_-__-_-__-_-_-__-_-":
			"So".writeln;
			break;
		case "_-__-_-__-_-_-__-_-_", "-__-_-__-_-_-__-_-__":
			"La".writeln;
			break;
		default:
			"Si".writeln;
			break;
	}

}

// ===================================

import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
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
