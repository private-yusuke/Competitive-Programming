void main() {
	auto S = rs.to!(dchar[]);
	auto T = rs.to!(dchar[]);
	int[] sarr = [0], tarr = [0];
	dchar last = S[0];
	foreach(i; S) {
		if(i == last) sarr[$-1]++;
		else sarr ~= 1;
		last = i;
	}
	last = T[0];
	foreach(i; T) {
		if(i == last) tarr[$-1]++;
		else tarr ~= 1;
		last = i;
	}
	auto scnt = S.sort().uniq.array.length;
	auto tcnt = T.sort().uniq.array.length;
	debug writeln(scnt);
	debug writeln(tcnt);
	debug writeln(sarr);
	debug writeln(tarr);
	if(scnt == tcnt && sarr == tarr) {
		writeln("Yes");
	} else writeln("No");
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