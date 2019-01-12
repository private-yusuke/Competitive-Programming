import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto ip = readln.split.to!(int[]), deg = ip[0], dis = ip[1];
	string dir = getDirection(deg);
	int W = getPower(dis);
	writefln("%s %d", (W == 0 ? "C" : dir), W);
}

string getDirection(int degree) {
	const dirs = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"];
	foreach(i; 0..dirs.length) {
		if(i*225 + 113 > degree) {
			return dirs[i];
		}
	}
	return "N";
}

int getPower(int distance) {
	const diss = [15, 93, 201, 327, 477, 645, 831, 1029, 1245, 1467, 1707, 1959];
	foreach(int i, diss_i; diss) {
		if(distance < diss_i) return i;
	}
	return 12;
}
