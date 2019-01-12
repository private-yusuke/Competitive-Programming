import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto A = readln.chomp.to!int, B = readln.chomp.to!int;
	int c;
	while(A % B != 0) {
		c++;
		A++;
	}
	c.writeln;
}
