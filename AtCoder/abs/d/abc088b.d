import std.stdio;
import std.conv;
import std.string;
import std.algorithm;
import std.math;

void main()
{
	auto N = readln.chomp.to!int;
	int alice;
	int bob;
	auto a = readln.split.to!(int[]);
	a.sort();
	foreach(i, v; a) {
		if(i & 1) bob+=v;
		else alice+=v;
	}
	abs(alice-bob).writeln;
}
