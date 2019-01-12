void main() {
	auto S = rs;
	auto T = rs;
	string ans = 'z'.repeat(100).to!string;

	foreach(i; 0..S.length-T.length+1) {
		bool ok = true;
		foreach(j; i..i+T.length) {
			if(S[j] == '?') continue;
			if(S[j] != T[j-i]) {
				ok = false;
				break;
			}
		}

		if(ok) {
			string res = "";
			foreach(j; 0..S.length) {
				// not in the range of T
				if(i <= j && j < i + T.length) {
					res ~= T[j-i];
				} else {
					res ~= (S[j] == '?' ? 'a' : S[j]);
				}
			}
			ans = min(ans, res);
		}
	}
	writeln(ans == 'z'.repeat(100).to!string ? "UNRESTORABLE" : ans);
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