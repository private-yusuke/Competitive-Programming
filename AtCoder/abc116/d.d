void main() {
	auto ip = readAs!(int[]), N = ip[0], K = ip[1];
	auto t = new int[](N);
	auto d = new int[](N);
	alias Sushi = Tuple!(int, "t", int, "d");
	Sushi[] arr;
	foreach(i; 0..N) {
		auto ip2 = readAs!(int[]), T = ip2[0], D = ip2[1];
		arr ~= Sushi(T, D);
	}
	ulong res;
	// p-sum
	auto tmparr = arr.dup.sort!"a.d > b.d"().array;
	auto rbt = redBlackTree!int;
	ulong tmp;
	foreach(v; tmparr[0..K]) {
		rbt.insert(v.t);
		tmp += v.d;
	}
	tmp += rbt.array.length^^2;
	res = tmp;
	
	// k-sum
	tmp = 0;
	auto tmparr2 = arr.dup.sort!"a.t < b.t"().group!"a.t == b.t".array.sort!"a[0].d > b[0].d"().array;
	//tmparr2.each!writeln;
	if(tmparr2.length >= K){
		//"a".writeln;
		//tmparr2[0..K].each!writeln;
		res = max(res, tmparr2[0..K].map!(i => i[0].d).sum + 2^^K);
	}
	foreach(v; tmparr2) {
		tmp += v[0].d;
	}
	tmp += 2 ^^ tmparr2.length;
	res = max(res, tmp);
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
