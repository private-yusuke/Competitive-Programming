void main() {
	real PII = 3.1415926535897932384626;
	auto ip = readAs!(real[]), A = ip[0], B = ip[1], H = ip[2], M = ip[3];
	auto theta = abs(2*PII*(H*60+M)/60/12 - 2*PII*M/60);
	debug writefln("%f %f", 2*PII*(H*60+M)/60/12, 2*PII*M/60);
	debug theta.writeln;
	theta = min(theta, 2*PII - theta);
	debug theta.writeln;
	debug writeln(2*PII*(H*60+M)/60/12 * 57.2958);
	debug writeln(2*PII*M/60 * 57.2958);
	debug writeln(theta*57.2958);

	writefln("%.15f", sqrt(pow(A, 2) + pow(B, 2) - 2*A*B*cos(theta)));
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