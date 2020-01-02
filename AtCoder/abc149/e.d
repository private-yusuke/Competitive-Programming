void main() {
	auto ip = readAs!(long[]), N = ip[0], M = ip[1];
	auto A = readAs!(long[]);
	auto arr = new long[](A.reduce!max+1);
	A.each!(v => arr[v]++);
	auto arr2 = FFT!double.Convolve(arr, arr);
	ulong k = arr2.length-1;
	ulong res;
	while(M > 0 && k > 0) {
		auto use = min(M, arr2[k]);
		M -= use;
		res += k * use;
		k--;
	}
	res.writeln;
}

import std.complex;
// Complex!T は isFloatingPoint!T を要求する。
class FFT(T = double) if(isFloatingPoint!T) {
	static long[] Convolve(E)(E[] g, E[] h) if(isNumeric!E) {
		auto s = g.length + h.length - 1; // 畳み込みの結果の配列サイズ
		auto n = 1;
		while(n < s) n *= 2; // FFTに使う配列のサイズ(2の累乗)
		auto gg = dft(g.to!(T[]) ~ 0.repeat(n - g.length).array.to!(T[]));
		auto hh = dft(h.to!(T[]) ~ 0.repeat(n - h.length).array.to!(T[]));
		auto ff = zip(gg, hh).map!(p => p[0] * p[1]).array;
		ff = dft(ff, true);
		ff[] /= complex!T(ff.length);
		return ff[0..s].map!(v => v.re.round).array.to!(long[]);
	}
	static Complex!T[] dft(T[] f, bool inverse = false) {
		auto f_comp = new Complex!T[](f.length);
		foreach(i, v; f) f_comp[i] = complex!T(v);
		return dft(f_comp, inverse);
	}
	// ifftの場合はf.lengthで割りましょう。
	static Complex!T[] dft(Complex!T[] f, bool inverse = false) {
		auto n = f.length;
		if(n == 1) return f;
		auto f0 = iota(0, n, 2).map!(i => f[i]).array;
		auto f1 = iota(1, n, 2).map!(i => f[i]).array;
		f0 = dft(f0, inverse);
		f1 = dft(f1, inverse);
		const auto zeta = complex!T(cos((2*PI / n).to!T), sin((2*PI / n).to!T));
		Complex!T zeta_pow = 1;
		foreach(i; 0..n) {
			f[i] = f0[i % (n/2)] + (inverse ? 1/zeta_pow : zeta_pow) * f1[i % (n/2)];
			zeta_pow *= zeta;
		}
		return f;
	}
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