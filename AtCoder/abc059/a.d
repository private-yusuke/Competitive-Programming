import std.stdio;
import std.string;
import std.conv;
import std.algorithm: canFind;

void main() {
	string[] inputs = split(readln());
	string s1 = inputs[0];
	string s2 = inputs[1];
	string s3 = inputs[2];
	
	format("%s%s%s", s1[0].toUpper, s2[0].toUpper, s3[0].toUpper);
}
