import std.stdio;
import std.string;
import std.conv;
import std.range;
import std.algorithm;
import std.math;
import std.bitmanip;

void main() {
	auto inputs1 = readln.split.to!(int[]), n = inputs1[0], X = inputs1[1];
	auto a = readln.split.to!(int[]);
	a.indexed(X.bitsSet).sum.writeln;
}
