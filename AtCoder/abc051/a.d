import std.stdio;
import std.string;
import std.conv;
import std.algorithm;

void main() {
	char[] input = readln().dup;
	input[5] = ' ';
	input[13] = ' ';
	input.writeln;
}
