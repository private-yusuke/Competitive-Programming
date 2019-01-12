import std.stdio;
import std.string;
import std.conv;
import std.algorithm;

void main() {
	int N = to!int(chomp(readln()));
	int K = to!int(chomp(readln()));
	int X = to!int(chomp(readln()));
	int Y = to!int(chomp(readln()));
	
	int fee;
	if(N < K) {
		fee = N*X;
		fee.writeln;
		return;
	}
	fee += K*X;
	if(!N-K < 1) fee += (N-K)*Y;
	fee.writeln;
}
