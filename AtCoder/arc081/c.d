void main() {
	auto N = ri;
	auto A = readAs!(int[]).sort!"a > b"().array;
	auto B = A.uniq.array;
	long last = A[0];
	int[] arr = [1];
	foreach(i; A[1..$]) {
		if(last == i) arr.back++;
		else {
			last = i;
			arr ~= 1;
		}
	}
	ulong len1, len2;
	foreach(i, v; arr) {
		if(v >= 4) {
			if(len1 == 0) {
				len1 = len2 = B[i];
				break;
			} else {
				len2 = B[i];
				break;
			}
		} else if(v >= 2) {
			if(len1 == 0) len1 = B[i];
			else {
				len2 = B[i];
				break;
			}
		}
	}
	writeln(len1 * len2);
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