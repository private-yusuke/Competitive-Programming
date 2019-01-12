int n, k;
int[] w;

void main() {
	auto ip = readAs!(int[]);
	n = ip[0], k = ip[1];
	foreach(i; 0..n) w ~= ri;

	writeln(solve());
}

int check(long p) {
	int i = 0;
	foreach(j; 0..k) {
		// 載せた荷物の重量の合計s
		long s = 0;
		// 最大積載量を越えない間、荷物を載せつづける。	
		while(s + w[i] <= p) {
			s += w[i];
			i++;
			// 全部乗せ終わった場合
			if(i == n) return n;
		}

		// ここに来たら、次のトラックに載せることにする。
	}
	return i;
}

// 最大積載量Pについて二分法を用いる。
long solve() {
	long left = 0, right = long.max;
	// 二分法が終わってないとき
	// 終わるのは、leftが条件を満たさない最大のPの値をとり、
	// rightが条件を満たす最小のPの値をとるときである。
	// この「条件を満たす境界」は一箇所のみ
	while(right - left > 1) {
		long mid = (left + right) / 2;
		// Pをmidとしてやる
		int v = check(mid); // 載った荷物の数
		if(v >= n) right = mid;
		else left = mid;
	}
	return right;
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