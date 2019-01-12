import std.stdio;
import std.string;
import std.conv;
import std.range;
import std.algorithm;
import std.math;
import std.bitmanip;

void main() {
	auto ip = readln.split.to!(int[]), A = ip[0], B = ip[1], C = ip[2];
	bool plus, minus;
	plus = (A + B == C ? true : false);
	minus = (A - B == C ? true : false);
	if(plus && minus) "?".writeln;
	else if(plus) "+".writeln;
	else if(minus) "-".writeln;
	else "!".writeln;
}
