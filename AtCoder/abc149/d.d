void main() {
	auto ip = readAs!(int[]), N = ip[0], K = ip[1];
	auto ip2 = readAs!(int[]), R = ip2[0], S = ip2[1], P = ip2[2];
	auto T = rs;
	string history;
	char win(char t) {
		if(t == 'r') return 'p';
		if(t == 's') return 'r';
		return 's';
	}
	int score(char t) {
		if(t == 'r') return R;
		if(t == 's') return S;
		return P;
	}
	int res;
	foreach(i, v; T) {
		if(i >= K) {
			auto last = history[i - K];
			if(last == win(v)) {
				history ~= "*";
				continue;
			} else {
				history ~= win(v);
				res += score(win(v));
			}
		} else {
			history ~= win(v);
			res += score(win(v));
		}
	}
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