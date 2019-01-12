import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto N = readln.chomp.to!int;
	auto R = new int[](N);
	foreach(i; 0..N)
		R[i] = readln.chomp.to!int;
	R.sort!"a > b";
	
	int r;
	foreach(i, R_i; R) {
		if(i % 2 == 0)
			r += pow(R_i, 2);
		else
			r -= pow(R_i, 2);
		//r.writeln;
	}
	writefln("%.7f", r*PI);
}
