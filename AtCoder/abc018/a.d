import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto s = new int[](3);
	foreach(i; 0..3) s[i] = readln.chomp.to!int;
	foreach(s_i; s) writeln(s.count!(a => a >= s_i));
}
