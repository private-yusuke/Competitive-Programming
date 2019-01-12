void main() {
	auto ip = readAs!(int[]), N = ip[0], K = ip[1];
	auto x = readAs!(int[]);

	long res = long.max;

	// K通りの範囲の取り方があります。
	// 左端は0番目からN-K番目までとっていきます
	foreach(i; 0..N-K+1) {
		auto l = x[i];
		auto r = x[i+K-1];
	
		// 同符号のとき	
		if((l < 0) == (r < 0)) {
			// 範囲が0より小さい値しかとってない場合
			if(r < 0) {
				// 0 -> l に一方通行で行けばよい
				res = min(res, abs(l));
			// そうじゃないとき(範囲が0以上の値のみをとっている場合)
			} else {
				// 0 -> r に一方通行で行けばよい
				res = min(res, r);
			}
		// 異符号のとき
		} else {
			// 0 -> l と 0 -> r のどっちが短いか
			if(abs(l) < abs(r)) {
				// 0 -> lのが短いとき
				// 0 -> l -> 0 -> r が一番短い
				res = min(res, abs(l) * 2 + abs(r));
			} else {
				// 0 -> rのが短いとき
				// 0 -> r -> 0 -> l が一番短い
				res = min(res, abs(r) * 2 + abs(l));
			}
		}
	}
	res.writeln;
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