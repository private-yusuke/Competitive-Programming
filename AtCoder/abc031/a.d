import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	string[] inputs = split(readln());
	int A = to!int(inputs[0]);
	int D = to!int(inputs[1]);
	int res = max((A+1)*D, A*(D+1));
	res.writeln;
}
