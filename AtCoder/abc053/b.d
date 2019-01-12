import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;
 
void main() {
	auto s = readln.chomp;
	(s.lastIndexOf('Z') - s.indexOf('A') + 1).writeln;
}