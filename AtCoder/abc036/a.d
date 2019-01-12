import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	string[] inputs = split(readln());
	float A = to!float(inputs[0]);
	float B = to!float(inputs[1]);
	
	(ceil(B / A)).writeln;
}
