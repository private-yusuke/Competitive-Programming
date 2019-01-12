import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	int X = to!int(chomp(readln()));
	(X % 10 + X / 10).writeln;
}
