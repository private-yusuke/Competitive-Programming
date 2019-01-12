alias Task = Tuple!(int, "start", int, "end");

void main() {
	auto n = ri;
	Task[] tasks = new Task[](n);
	foreach(i; 0..n) {
		auto s = readAs!(int[]);
		tasks[i] = Task(s[0], s[1]);
	}
	tasks.sort!((a, b) => a.end < b.end);

	int d;
	int res;
	foreach(t; tasks) {
		if(d < t.start) { // check whether the current task is done or not
			d = t.end;
			res++;
		}
	}
	res.writeln;

}

/*
1:
	5
	1 3
	2 5
	4 7
	6 9
	8 10
*/

// ===================================

import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
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