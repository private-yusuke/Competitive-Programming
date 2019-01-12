void main() {
	auto s = rs.to!dstring;
	ulong res = ulong.max;
	foreach(dchar i; 'a'..'z'+1) {
		ulong cnt;
		auto tmp = s.to!(dchar[]);
		while(tmp.uniqcount != 1)
		{
			cnt++;
			foreach(c; 0..tmp.length-1) {
				dchar current = tmp[c];
				dchar next = tmp[c+1];
				if(next == i) tmp[c] = i;
			}
			tmp = tmp[0..$-1];
			if(cnt > 100) break;
		}
		res = min(res, cnt);
	}
	writeln(res);
}

ulong uniqcount(T)(T[] arr) {
	auto a = arr.deepcopy;
	return a.sort().uniq.array.length;
}

T[] deepcopy(T)(T[] a) {
	import std.traits : isArray;
	static if(isArray!T) {
		T[] res;
		foreach(i; a) {
			res ~= deepcopy(i);
		}
		return res;
	} else {
		return a.dup;
	}
}

unittest
{
	auto a = [[[1,2],[3,4]],[[5,6],[7,8]]];
	auto b = a.deepcopy;
	b[0][0][1] = 100;
	assert(a != b);
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

int ri() {
	return readAs!int;
}

double rd() {
	return readAs!double;
}

string rs() {
	return readln.chomp;
}