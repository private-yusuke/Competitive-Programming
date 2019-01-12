import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	int A = to!int(chomp(readln()));
	pow(A/2, 2).writeln;
}
