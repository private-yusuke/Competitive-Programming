void main() {
	auto ip = readAs!(BigInt[]), C = ip[0], D = ip[1];
	BigInt k = 140/2, j = 170/2;
	BigInt cnt;
	while(k <= D) {
		k *= 2;
		j *= 2;
		debug writefln("[%d, %d)", k, j);
		debug writefln("cnt += %d - %d + 1", min(j, D), max(k+1, C+1));
		if(D < k) break;
		BigInt tmp = min(j, D) - max(k+1, C+1) + 1;
		if(tmp > 0) cnt+=tmp;
	}
	if(0 > cnt) writeln(0);
	else writeln(cnt);
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