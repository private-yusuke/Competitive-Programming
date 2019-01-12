import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	string[] inputs = split(readln());
	int x = to!int(inputs[0]);
	int y = to!int(inputs[1]);
	if(x < y) "Better".writeln;
	else "Worse".writeln;
}
