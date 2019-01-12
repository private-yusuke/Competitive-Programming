import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.conv;

void main() {
	string[char] d;
	d['a'] = rs;
	d['b'] = rs;
	d['c'] = rs;
	import std.uni;
	solve(d).toUpper.writeln;
}

char solve(string[char] d) {
	if(d['a'].length == 1) return 'a';
	char turn = 'a';
	while(true) {
		if(d[turn].length == 0) return turn;
		char tmp = turn;
		turn = d[turn].front.to!char;
		d[tmp].popFront;
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