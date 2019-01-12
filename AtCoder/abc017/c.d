void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	int[] arr = new int[](M+1);
	int sum_s;
	foreach(i; 0..N) {
		auto ip2 = readAs!(int[]), l = ip2[0], r = ip2[1], s = ip2[2];
		arr[l-1] += s;
		arr[r] -= s;
		sum_s += s;
	}
	foreach(i; 0..M-1) arr[i+1] = arr[i] + arr[i+1];
	writeln(sum_s - arr[0..$-1].reduce!min);
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
