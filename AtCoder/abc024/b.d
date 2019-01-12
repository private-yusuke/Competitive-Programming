import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto ip = readln.split.to!(int[]), N = ip[0], T = ip[1];
	auto A = new int[](N);
	foreach(i; 0..N) {
		A[i] = readln.chomp.to!int;
	}
	
	int count;
	int currentTime = A[0];
	//A.writeln;
	foreach(i; 1..N) {
		if(currentTime + T <= A[i]) {
			count += T;
			currentTime = A[i];
		} else {
			count += A[i] - currentTime;
			currentTime = A[i];
		}
		//writefln("%d, %d, %d", count, currentTime, A[i]);
	}
	count += T;
	count.writeln;
}
