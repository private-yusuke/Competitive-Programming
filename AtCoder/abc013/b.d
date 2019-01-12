import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto a = readln.chomp.to!int, b = readln.chomp.to!int;
	min(abs(a-b), abs(b-a), abs(10+a-b), abs(10+b-a)).writeln;
}
