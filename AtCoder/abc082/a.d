import std.stdio;
import std.string;
import std.conv;
import std.math;

void main() {
	string[] inputs = split(readln());
	int a = to!int(inputs[0]);
	int b = to!int(inputs[1]);
	
	real m = (a + b) / 2.;
	writeln(format("%s", ceil(m)));
}
