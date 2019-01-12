import std.stdio;
import std.conv;
import std.string;
import std.algorithm;
import std.math;

void main()
{
	auto ip = readln.split.to!(int[]), a = ip[0], b = ip[1];

	if(a*b % 2 == 1) "Odd".writeln;
	else "Even".writeln;
}
