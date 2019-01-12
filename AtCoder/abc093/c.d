void main() {
	auto ip = readAs!(int[]);
	ip.sort();
	auto A = ip[0], B = ip[1], C = ip[2];
	// どのような順番で操作しても、単純に足し算をしているだけなので影響しません
	// sortしても全然オッケー
	auto m = max(A, B, C);
	int r = m;
	int count;
	if(!(m & 1) == ((A + B + C) & 1)) r++; // ゴールの値 editorial参照
	while(A + 2 <= r) { A += 2; count++; } //
	while(B + 2 <= r) { B += 2; count++; } // 可能な限り2を足し続ける
	while(C + 2 <= r) { C += 2; count++; } //
	// 上限に満ちてない値が2つある状況 or ない状況になるはず
	if(A + B == 2*r - 2 || B + C == 2*r - 2 || C + A == 2*r - 2) count++;
	count.writeln;
}

// ===================================

import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
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