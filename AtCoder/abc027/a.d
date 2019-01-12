import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	string[] inputs = split(readln());
	int l_1 = to!int(inputs[0]);
	int l_2 = to!int(inputs[1]);
	int l_3 = to!int(inputs[2]);
	int[int] m;
	m[l_1]++;
	m[l_2]++;
	m[l_3]++;
	if(m[l_1] == 1) l_1.writeln;
	else if(m[l_2] == 1) l_2.writeln;
	else l_3.writeln;
}
