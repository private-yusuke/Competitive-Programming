import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto li = readln.split.to!(int[]);
	li.sort();
	li[1].writeln;
}
