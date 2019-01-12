void main() {
	auto S = rs.to!(dchar[]);
	auto T = rs.to!(dchar[]);
	auto sbt = redBlackTree!dchar;
	auto tbt = redBlackTree!dchar;
	ulong[] sarr, tarr;
	dchar[] ssarr, tsarr;
	foreach(i; S) {
		auto k = sbt.insert(i);
		if(k != 0) ssarr ~= i;
		sarr ~= (k == 0 ? ssarr.indexOf(i)+1 : k - 1);
	}
	foreach(i; T) {
		auto k = tbt.insert(i);
		if(k != 0) tsarr ~= i;
		tarr ~= (k == 0 ? tsarr.indexOf(i)+1 : k - 1);
	}
	debug writeln(sarr);
	debug writeln(tarr);
	debug writeln(ssarr);
	debug writeln(tsarr);
	if(sarr == tarr) writeln("Yes");
	else writeln("No");
}

// ===================================

import std.stdio;
import std.string;
import std.functional;
import std.conv;
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