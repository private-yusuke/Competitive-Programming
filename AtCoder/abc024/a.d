import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	string[] input1 = split(chomp(readln()));
	string[] input2 = split(chomp(readln()));
	int A = to!int(input1[0]);
	int B = to!int(input1[1]);
	int C = to!int(input1[2]);
	int K = to!int(input1[3]);
	
	int S = to!int(input2[0]);
	int T = to!int(input2[1]);
	
	int fee;
	fee += (A*S + B*T);
	if(S+T >= K) fee -= (S+T)*C;
	fee.writeln;
}
