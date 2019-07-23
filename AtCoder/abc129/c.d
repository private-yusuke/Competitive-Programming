void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	auto rbt = new redBlackTree!int;
	foreach(i; 0..M) rbt.insert(ri);
	auto arr = new int[](N);
	arr[0] = 1;
	arr[1] = rbt.contains(2) ? 0 : 1;
	foreach(i; 2..N) {
		bool back2 = rbt.contains(i-1);
		bool back1 = rbt.contains(i);
		int tmp;
		if(!back2) tmp += arr[i-2];
		if(!back1) tmp += arr[i-1];
		if(!rbt.contains(i+1)) arr[i] = tmp % 1000000007;
	}
	arr.back.writeln;
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