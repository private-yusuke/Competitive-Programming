void main() {
	auto ip = readAs!(long[]), N = ip[0], M = ip[1];
	Cake[] cakes;

	foreach(_; 0..N) {
		auto ip2 = readAs!(long[]), a = ip2[0], b = ip2[1], c = ip2[2];
		long[] score;
		foreach(i; [1,-1]) foreach(j; [1,-1]) foreach(k; [1,-1]) {
			score ~= a*i+b*j+c*k;
		}
		cakes ~= Cake(a, b, c,score);
	}
	ulong res;
	foreach(i; 0..8) {
		cakes.sort!((a, b) => a.score[i] > b.score[i]);
		res = max(res, calc(cakes[0..M]));
	}
	res.writeln;
}
alias Cake = Tuple!(long, "x", long, "y", long, "z", long[], "score");


ulong calc(Cake[] cakes) {
	long beat, deli, popu;
	foreach(i; cakes) {
		beat += i.x;
		deli += i.y;
		popu += i.z;
	}
	return abs(beat)+abs(deli)+abs(popu);
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