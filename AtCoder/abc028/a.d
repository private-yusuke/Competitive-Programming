import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	int N = to!int(chomp(readln()));
	if(N <= 59) "Bad".writeln;
	else if(N <= 89) "Good".writeln;
	else if(N <= 99) "Great".writeln;
	else "Perfect".writeln;
}
