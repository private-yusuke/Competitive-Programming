import std.stdio;
import std.string;
import std.conv;
import std.range;
import std.algorithm;
import std.math;
import std.bitmanip;

void main() {
	auto N = readln.chomp.to!int;
	auto A = readln.split.to!(int[]);
	int count, bugs;
	foreach(A_i; A) {
		if(A_i == 0) continue;
		count++;
		bugs += A_i;
	}
	ceil(1. * bugs / count).writeln;
	
	/*
	 * auto b = a.filter!"a>0".array, sb = b.sum, sn = b.length;
	 * writeln((sb+sn-1)/sn);
	 * /
}
