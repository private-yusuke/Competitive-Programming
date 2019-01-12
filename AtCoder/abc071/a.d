import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	string[] inputs = split(readln());
	int x = to!int(inputs[0]);
	int a = to!int(inputs[1]);
	int b = to!int(inputs[2]);
	
	if(abs(x - a) < abs(x - b)) 'A'.writeln;
	else 'B'.writeln;
}
