void main() {
	auto ip = readAs!(ulong[]), N = ip[0], A = ip[1], B = ip[2], K = ip[3];
	ulong res;
	// G = A + B より、結局GはRとBどちらも塗るのと同じことになる。
	// よって、A, Bそれぞれについて、各ブロックに塗るか塗らないかで考えられる。
	// Rの数をx, Bの数をyとし、Ax+By=Kであるとき、nCr(N, x) * nCr(N, y)を求めればよい。
	foreach(x; 0..N+1) {
		auto c = K - A*x; // By
		if(c%B!=0 || c < 0) continue;
		auto y = c / B;
		if(y > N || y < 0) continue;
		res += (nCr(N, x) * nCr(N, y)) % 998244353;
		res %= 998244353;
	}
	writeln(res);
}

ulong nCr(ulong n, ulong r)
{
    ulong x = 1;
    foreach (i; n - r + 1 .. n + 1) {
        x *= i;
        x %= 998244353;
    }
    foreach (i; 1 .. r + 1)
        x /= i;
    return x;
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