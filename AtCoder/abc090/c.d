import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;
import std.range;

void main() {
	auto ip = readln.split.to!(ulong[]), N = ip[0], M = ip[1];
	/*auto a = new bool[][](N, M);
	//N: tate, M: yoko
	// omote: false, ura: true

	foreach(i; 0..N) { //tate
		foreach(j; 0..M) { //yoko
			foreach(k; -1..2) { //tate
				if(i+k < 0 || i+k >= N) continue;
				foreach(l; -1..2) { //yoko
					if(j+l < 0 || j+l >= M) continue;
					a[i+k][j+l] = !a[i+k][j+l];
				}
			}
		}
	}
	//a.writeln;
	uint count;
	foreach(b; a) {
		foreach(c; b) {
			if(c) count++;
		}
	}
	count.writeln;
	*/
	if(N == 1 && M == 1)	1.writeln;
	else if(N == 1) 		(M - 2).writeln;
	else if(M == 1) 		(N - 2).writeln;
	else 					((N-2)*(M-2)).writeln;
}
