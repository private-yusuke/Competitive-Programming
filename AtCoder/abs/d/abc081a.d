import std.stdio;
import std.conv;
import std.string;
import std.algorithm;
import std.math;

void main()
{
  readln.chomp.count!(a => a == '1').writeln;
}
