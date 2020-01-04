void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	auto name = readAs!(dchar[]), kit = readAs!(dchar[]);
	auto name_set = name.sort().uniq.array;
	auto kit_set = kit.sort().uniq.array;
	if(setIntersection(name_set, kit_set).array != name_set) {
		writeln(-1);
		return;
	}
	auto kit_arr = kit.filter!(v => name_set.canFind(v)).array.sort().group.array;
	auto name_arr = name.sort().group.array;
	ulong res = 1;
	foreach(i; 0..name_set.length) {
		res = max(res, (name_arr[i][1]*1. / kit_arr[i][1]).ceil.to!ulong);
	}
	res.writeln;
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
