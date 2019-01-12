void main() {
	auto ip = readAs!(int[]), sx = ip[0], sy = ip[1], tx = ip[2], ty = ip[3];
	auto dx = tx-sx, dy = ty-sy;

	'U'.repeat(dy).write;
	'R'.repeat(dx).write;
	'D'.repeat(dy).write;
	'L'.repeat(dx+1).write;

	'U'.repeat(dy+1).write;
	'R'.repeat(dx+1).write;
	'D'.write;
	'R'.write;
	'D'.repeat(dy+1).write;
	'L'.repeat(dx+1).write;
	'U'.write;
}

// ===================================

import std.stdio;
import std.string;
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