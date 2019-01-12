import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.conv;

void main() {
	auto n = (readln.chomp.to!int % 500);
	auto A = readln.chomp.to!int;
	if(n > A) "No".writeln;
	else "Yes".writeln;
}