import std.stdio;
import std.string;
import std.conv;
import std.math;

void main() {
	string[] inputs = split(readln());
	int A = to!int(inputs[0]);
	int B = to!int(inputs[1]);
	
	int result = A + B;
	if(result < 10) result.writeln;
	else "error".writeln;
}
