import std.stdio;
import std.string;
import std.conv;
import std.range;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto n = readln.chomp.to!int;
	if(n & 1) writeln(++n);
	else writeln(--n);
}
