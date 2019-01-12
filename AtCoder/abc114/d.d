void main() {
	auto N = readAs!ulong;
	
	// 75 = 3 * 5^2
	// (75), (3, 25), (5, 15), (3, 5, 5)
	// (74), (2, 24), (4, 14), (2, 4, 4)
	pl = generate_prime_list(100);
	ulong[ulong] arr;
	foreach(i;  1..N+1) {
			foreach(k; pl) {
			ulong p = 1;
			while(i % k^^p == 0) {
				arr[k]++;
				p++;
			}
		}
	}
	ulong res;
	ulong r(ulong m) {
		return arr.values.count!(i => i >= m - 1);
	}
	res += r(75);
	res += r(25) * (r(3) - 1);
	res += r(15) * (r(5) - 1);
	res += r(5) * (r(5) - 1) * (r(3) - 2) / 2;
	res.writeln;
}

ulong[] pl;

ulong[] generate_prime_list(T)(T N) if(isIntegral!T) {
	ulong[] prime_list = [2];
	bool not_prime = false;
	foreach(i; 3..N.to!ulong+1) {
		foreach(j; prime_list) {
			if(i % j == 0) {
				not_prime = true;
				break;
			}
		}
		if(!not_prime) prime_list ~= i;
		not_prime = false;
	}
	return prime_list;
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
