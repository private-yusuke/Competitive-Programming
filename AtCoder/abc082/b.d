import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto s = readln.chomp.to!(dchar[]), t = readln.chomp.to!(dchar[]);
	s.sort();
	t.sort!"a > b";
	
	writeln(s < t ? "Yes": "No");
}
