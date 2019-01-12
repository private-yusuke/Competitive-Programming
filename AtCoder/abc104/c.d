void main() {
	auto ip = readAs!(int[]), D = ip[0], G = ip[1];
	int[] ps, cs;
	long res = long.max;

	foreach(i; 0..D) {
		auto ip2 = readAs!(int[]), p = ip2[0], c = ip2[1];
		ps ~= p;
		cs ~= c;
	}
	foreach(i; bitset(D)) {
		long tmp, cnt, max_index;
		foreach(j, v; i) {
			if(v) {
				tmp += (j + 1) * 100 * ps[j] + cs[j];
				cnt += ps[j];
			} else {
				max_index = j;
			}
		}
		if(tmp < G) {
			long s = 100 * (max_index + 1);
			long need = ceil((G - tmp) / s.to!double).to!long;
			if(need >= ps[max_index]) continue;
			cnt += need;
		}
		res = min(res, cnt);
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

bool[][] bitset(T)(T n) if (isIntegral!T) {
	bool[][] res;
	foreach(i; 0..2^^n) {
		res ~= format(format("%%.%db", n), i).map!(i => i == '0' ? false : true).array;
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