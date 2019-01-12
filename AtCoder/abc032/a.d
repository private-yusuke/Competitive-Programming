import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	int a = to!int(chomp(readln()));
	int b = to!int(chomp(readln()));
	int n = to!int(chomp(readln()));
	while(!(n % a == 0 && n % b == 0)) {
		n++;
	}
	n.writeln;
}
