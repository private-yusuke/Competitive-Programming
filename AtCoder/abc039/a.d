import std.stdio;
import std.string;
import std.conv;
import std.algorithm;

void main() {
	string[] inputs = split(readln());
	int A = to!int(inputs[0]);
	int B = to!int(inputs[1]);
	int C = to!int(inputs[2]);
	int res = A*B*2 + B*C*2 + C*A*2;
	res.writeln;
}
