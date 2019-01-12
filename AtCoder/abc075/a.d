import std.stdio;
import std.string;
import std.conv;

void main() {
	string[] inputs = split(readln());
	int A = to!int(inputs[0]);
	int B = to!int(inputs[1]);
	int C = to!int(inputs[2]);
	
	if(A == B) writeln(C);
	else if(A == C) writeln(B);
	else writeln(A);
}
