void main() {
	auto N = ri;
	auto A = readAs!(ulong[]);
	ulong res, total, xor_sum, r;

	foreach(l; 0..N) {
		// 尺取り法(l: left, r: right)
		// 題意(和とxorが等しい)を満たすなら
		while(r < N && (total + A[r] == (xor_sum ^ A[r]))) {
			total += A[r];
			xor_sum ^= A[r];
			r += 1; // ひとつ右に進める

			//writefln("[%d, %d)", l, r);
			//debug iota(l, r).map!(a => A[a]).writeln;
		}
		res += r - l; // 区間長をたす(一回前までうまくいっていたので)
		//debug write("*", r - l, " ");

		// 区間の左端をひとつ右に進めるので、そのぶん(A[i])をなかったことにする
		total -= A[l];
		xor_sum ^= A[l];
		/*
		＿人人人人人人人人人人＿
		＞　xorの逆演算はxor　＜ … a = (a xor b) xor b
		￣Y^Y^Y^Y^Y^Y^Y^YY^Y^Y￣
		*/
	}
	res.writeln;

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