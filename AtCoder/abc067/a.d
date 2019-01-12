import std.stdio;
import std.string;
import std.conv;
import std.algorithm;

void main() {
	string[] inputs = split(readln());
	int A = to!int(inputs[0]);
	int B = to!int(inputs[1]);
	if(A % 3 == 0 || B % 3 == 0 || (A + B) % 3 == 0) "Possible".writeln;
	else "Impossible".writeln;
}
