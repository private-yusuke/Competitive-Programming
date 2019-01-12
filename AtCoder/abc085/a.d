import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto S = readln.chomp.to!(dchar[]);
	S[3] = '8';
	writeln(S);
}
