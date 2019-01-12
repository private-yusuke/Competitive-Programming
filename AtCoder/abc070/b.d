import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.range;

void main() {
	auto ip = readln.split.to!(int[]), A = ip[0], B = ip[1], C = ip[2], D = ip[3];
	if(B <= C || D <= A) 0.writeln;
	else if(A <= C) (B < D ? B - C : D - C).writeln;
	else (B < D ? B - A : D - A).writeln;
}
