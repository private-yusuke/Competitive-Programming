import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto n = readln.chomp.to!int;
	auto a = readln.split.to!(int[]);
	int count;
	foreach(a_n; a) {
		int b = a_n % 6;
		if(b > 3) count += b-3;
		else if(b == 0) count += 3;
		else if(b == 2) count++;
	}
	count.writeln; 
}
