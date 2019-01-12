import std.stdio;
import std.string;
import std.conv;
import std.math;

void main() {
	string[] inputs = split(readln());
	int X = to!int(inputs[0]);
	int A = to!int(inputs[1]);
	int B = to!int(inputs[2]);
	
	if(A - B >= 0) "delicious".writeln;
	else if(X >= abs(A - B)) "safe".writeln;
	else "dangerous".writeln;
}
