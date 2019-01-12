import std.stdio;
import std.string;
import std.conv;
import std.algorithm;

void main() {
	string[] inputs = split(readln());
	int A = to!int(inputs[0]);
	int B = to!int(inputs[1]);
	int C = to!int(inputs[2]);
	
	int value = min(A, B);
	(C/value).writeln;
}
