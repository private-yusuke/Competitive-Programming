void main() {
	auto N = ri;
	auto A = readAs!(long[]);
	bool[] sea = new bool[](N+2);
	sea[0] = sea[N+1] = true;
	A.enumerate.each!(i => sea[i.index+1] = i.value <= 0);
	
	long tmp;
	foreach(i; 1..N+1) {
		if(!sea[i] && sea[i-1]) tmp++;
	}
	if(N == 1 && A[0] > 0) tmp = 1;
	
	auto B = A.dup.enumerate.filter!(i => i.value > 0).array.sort!"a.value < b.value"().array;
	
	long res = tmp;
	
	foreach(k, p; B) {
		//debug writefln("%d, %d", p.index, p.value);
		ulong cnt;
		auto i = p.index;
		if(sea[i]) cnt++;
		if(sea[i+2]) cnt++;
		if(cnt == 2) tmp--;
		else if(cnt == 0) tmp++;
		sea[i+1] = true;
		
		if(k+1 == B.length || B[k].value < B[k+1].value) {
			debug writefln("level %d, %d, %d", B[k].value, res, tmp);
			res = max(res, tmp);
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
