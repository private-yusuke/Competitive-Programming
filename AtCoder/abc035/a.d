import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	string[] inputs = split(readln());
	int W = to!int(inputs[0]);
	int H = to!int(inputs[1]);
	if(W % 16 == 0 && H % 9 == 0) "16:9".writeln;
	else "4:3".writeln;
}
