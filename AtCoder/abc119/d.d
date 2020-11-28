void main() {
	auto ip = readAs!(long[]), A = ip[0], B = ip[1], Q = ip[2];
	auto s = A.iota.map!(i => rl).array.assumeSorted;
	auto t = B.iota.map!(i => rl).array.assumeSorted;
	foreach(i; 0..Q) {
		auto x = rl;
		auto xtl = t.lowerBound(x);
		auto xtu = t.upperBound(x);
		auto xsl = s.lowerBound(x);
		auto xsu = s.upperBound(x);

		long res = long.max;

		if(!xtl.empty) {
			auto xt = xtl.back;
			auto tsl = s.lowerBound(xt);
			auto tsu = s.upperBound(xt);

			ulong tmp = ulong.max;
			if(!tsl.empty)
				tmp = min(tmp, abs(tsl.back - xt));
			if(!tsu.empty)
				tmp = min(tmp, abs(tsu.front - xt));

			res = min(res, abs(x - xt) + tmp);
		}

		if(!xtu.empty) {
			auto xt = xtu.front;
			auto tsl = s.lowerBound(xt);
			auto tsu = s.upperBound(xt);

			ulong tmp = ulong.max;
			if(!tsl.empty)
				tmp = min(tmp, abs(tsl.back - xt));
			if(!tsu.empty)
				tmp = min(tmp, abs(tsu.front - xt));

			res = min(res, abs(x - xt) + tmp);
		}

		if(!xsl.empty) {
			auto xs = xsl.back;
			auto stl = t.lowerBound(xs);
			auto stu = t.upperBound(xs);

			ulong tmp = ulong.max;
			if(!stl.empty)
				tmp = min(tmp, abs(stl.back - xs));
			if(!stu.empty)
				tmp = min(tmp, abs(stu.front - xs));

			res = min(res, abs(x - xs) + tmp);
		}

		if(!xsu.empty) {
			auto xs = xsu.front;
			auto stl = t.lowerBound(xs);
			auto stu = t.upperBound(xs);

			ulong tmp = ulong.max;
			if(!stl.empty)
				tmp = min(tmp, abs(stl.back - xs));
			if(!stu.empty)
				tmp = min(tmp, abs(stu.front - xs));

			res = min(res, abs(x - xs) + tmp);
		}

		res.writeln;
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

long rl() {
	return readAs!long;
}

double rd() {
	return readAs!double;
}

string rs() {
	return readln.chomp;
}
