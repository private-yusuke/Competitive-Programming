import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

string[] dirs = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"];
int[] diss = [0, 3, 16, 34, 55, 80, 108, 139, 172, 208, 245, 285, 327];

void main() {
	auto ip = readln.split.to!(int[]), deg = ip[0], dis = ip[1];
	string dir;
	int W;
	foreach(i; 0..dirs.length) {
		if(i*225 + 113 > deg) {
			dir = dirs[i];
			break;
		}
	}
	if(3487 < deg) dir = "N";
	foreach(int i, diss_i; diss) {
		if(round(dis/6.)+1e-7 < diss_i) {
			W = i-1;
			break;
		}
	}
	if(diss[11] < round(dis/6.)) W = 12;
	
	if(W <= 0) {
		dir = "C";
		W = 0;
	}
	writefln("%s %d", dir, W);
}
