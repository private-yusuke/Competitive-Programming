void main() {
	auto N = ri;
	long l = 0, r = N - 1;
	alias Pair = Tuple!(long, "ind", string, "state");
	Pair[] pairs;
	l.writeln;
	stdout.flush();
	pairs ~= Pair(0, rs);
	r.writeln;
	stdout.flush();
	pairs ~= Pair(r, rs);
	if(pairs.any!(p => p.state == "Vacant")) return;

	bool solve() {
		auto m = (l + r) / 2;
		m.writeln;
		stdout.flush();
		auto S = rs;
		if(S == "Vacant") return true;
		else {
			auto p = Pair(m, S);
			foreach(k; 0..2) {
				if(p.state == pairs[k].state && (p.ind - pairs[k].ind).abs % 2 == 1) {
					pairs[(k+1)%2] = p;
				} else if(p.state != pairs[k].state && (p.ind - pairs[k].ind).abs % 2 == 0) {
					pairs[(k+1)%2] = p;
				}
			}
			auto arr = pairs.map!(p => p.ind).array.sort().array;
			l = arr[0], r = arr[1];
		}
		return false;
	}
	while(!solve()) {}
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