import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.range;

void main() {
	auto S = readln.chomp.to!(char[]);
	auto ni = (iota('a', 'z').chain('z'.only)).find!(c => !S.canFind(c));
	ni.empty ? writeln("None") : writeln(ni.front);
}
