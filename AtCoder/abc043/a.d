import std.stdio;
import std.string;
import std.conv;
import std.algorithm;

void main() {
	int N = to!int(chomp(readln()));
	int res;
	for(int i = 0; i <= N; i++) {
		res += i;
	}
	res.writeln;
}
