void main() {
	auto ip = readAs!(int[]), H = ip[0], W = ip[1];
	auto N = ri;
	auto a = readAs!(int[]);
	a.enumerate(1) // それぞれの個数の配列に、担当する値を付ける
		.map!(i => i.index.repeat(i.value)) // それぞれ必要な分だけ値を配列に入れておく
		.join // 統合(concat) so that 一列に全部並ぶ
		//.slide(W, W) // W個ごとに要素を分ける。バージョンが低いのでAtCoder上でコンパイルが通らない
		.wakeru(W)
		.enumerate // 分けた要素(配列)に添字をつける
		.map!(i => i.index % 2 == 1 ? i.value.retro.array : i.value) // 奇数番目は逆にする
		.each!(i => writefln("%(%s %)", i)); // 出力
	// 一行シリーズ
}

int[][] wakeru(int[] arr, ulong n) {
	int[][] res;
	foreach(i; 0..arr.length / n) {
		res ~= arr[i*n..(i+1)*n];
	}
	return res;
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