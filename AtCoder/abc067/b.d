import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;
 
void main() {
	auto ip = readln.split.to!(int[]), N = ip[0], K = ip[1];
	auto l = readln.split.to!(int[]);
	l.sort!"a > b";
	l[0..K].sum.writeln;
}