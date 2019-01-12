import std.stdio;
import std.string;
import std.conv;
import std.algorithm;

void main() {
	readln.chomp.split("+").map!(a => a.split("*").to!(int[])).count!(a => !a.canFind(0)).writeln;
}