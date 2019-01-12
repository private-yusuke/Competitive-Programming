import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	string[] inputs = split(readln());
	float A = to!float(inputs[0]);
	float B = to!float(inputs[1]);
	float C = to!float(inputs[2]);
	float D = to!float(inputs[3]);
	if(B/A == D/C) "DRAW".writeln;
	else if(B/A > D/C) "TAKAHASHI".writeln;
	else "AOKI".writeln;
}
