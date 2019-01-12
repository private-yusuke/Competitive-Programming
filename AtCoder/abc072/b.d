import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;
import std.range;

void main() {
	readln.chomp.enumerate.filter!"a[0]%2==0".map!"a[1]".writeln;
}
