import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto N = readln.chomp.to!int;
	writefln("%02d:%02d:%02d", N/3600, (N/60)%60, N%60);
}
