void main() {
	(S => ((N, cnt) => cnt == 0 ? N : (N - cnt) / (2*cnt) * 2 + 1)(S.length, S.sort().group.count!(v => v[1] % 2 == 1)))(readln.chomp.to!(dchar[])).writeln;
	/*auto S = readln.chomp.to!(dchar[]);
	auto N = S.length;
	auto cnt = S.sort().group.count!(p => p[1] % 2 == 1);
	debug writefln("%s %d %d", S, N, cnt);
	if(cnt == 0) N.writeln;
	else writeln((N - cnt) / (2 * cnt) * 2 + 1);
	*/
}

// ===================================

import std.stdio;
import std.string;
import std.functional;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.container;
import std.bigint;
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