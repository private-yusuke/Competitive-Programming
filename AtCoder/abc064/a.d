import std.stdio;
import std.string;
import std.conv;
import std.math;

void main() {
	string[] inputs = split(readln());
	int A = to!int(inputs[0]);
	int B = to!int(inputs[1]);
	
	if((10*g + b) % 4 == 0) "YES".writeln;
	else "NO".writeln;
}
