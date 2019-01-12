import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;
import std.range;

void main() {
	auto A = readln.chomp.to!int, B = readln.chomp.to!int, C = readln.chomp.to!int, X = readln.chomp.to!int;
	int count;
	foreach(i; 0..A+1) {
		foreach(j; 0..B+1) {
			foreach(k; 0..C+1) {
				if(500*i + 100*j + 50*k == X) count++;
			}
		}
	}
	count.writeln;
}
