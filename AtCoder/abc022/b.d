import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto N = readln.chomp.to!int;
	/*auto A = new int[](N);
	
	int count;
	
	foreach(i; 0..N) {
		A[i] = readln.chomp.to!int;
	}
	foreach(i; 0..N) {
		auto A_i = A[i];
		foreach(j; 0..i) {
			auto A_j = A[j];
			//writefln("i: %d, j: %d, A_i: %d, A_j: %d, %d", i, j, A_i, A_j, count);
			if(A_j == A_i) {
				count++;
				break;
			}
		}
	}
	writeln(count);
	*/
	int count;
	int[int] c;
	foreach(_; 0..N) {
		c[readln.chomp.to!int]++;
	}
	foreach(v; c.byValue) {
		count += v-1;
	}
	writeln(count);
}
