import std.stdio;
import std.string;
import std.conv;
import std.range;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto s = readln.chomp.map!(a => a.to!int).array;
	auto t = s.sort().uniq.array;
	if(s.length != t.length) "no".writeln;
	else "yes".writeln;
}