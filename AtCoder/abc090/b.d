import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;
import std.range;

void main() {
	auto ip = readln.split.to!(int[]), A = ip[0], B = ip[1];
	/*uint r = A / 1000;
	uint p = A.to!string[2].to!uint - '0';
	uint s = r*1000 + p*100 + r;
	uint count;
	while(s <= B) {
		count++;
		if(p == 9) {
			p = 0;
			r++;
		}
		else p++;


		s = r*1000 + p*100 + r;
	}
	count.writeln;
	*/
	uint count;
	uint p = 100;
	uint i;
	uint j;
	uint k;
	string a;
	while(p < 1000) {
		a = p.to!string;
		i = 10000*(a[0].to!uint - '0') + 1000*(a[1].to!uint - '0');
		j = 10*(a[1].to!uint - '0') + (a[0].to!uint - '0');
		k = i + j + 100*(a[2].to!uint - '0');

		if(k >= A && k <= B) count++;
		p++;
	}
	count.writeln;
}
