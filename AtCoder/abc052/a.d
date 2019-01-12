import std.stdio;
import std.string;
import std.conv;
import std.algorithm;

void main() {
	string[] inputs = split(readln());
	int A = to!int(inputs[0]);
	int B = to!int(inputs[1]);
	int C = to!int(inputs[2]);
	int D = to!int(inputs[3]);
	max(A*B, C*D).writeln;
}
