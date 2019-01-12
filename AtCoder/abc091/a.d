import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	((ushort[] ip) => ip[0] + ip[1] >= ip[2] ? "Yes" : "No")(readln.split.to!(ushort[])).writeln;
}