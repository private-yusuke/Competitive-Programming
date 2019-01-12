import std.stdio;
import std.string;
import std.conv;
import std.math;

void main() {
	int N = to!int(chomp(readln()));
	int A = to!int(chomp(readln()));
	
	writeln(pow(N, 2) - A);
}
