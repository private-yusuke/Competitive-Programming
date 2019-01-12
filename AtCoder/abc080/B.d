import std.stdio, std.conv, std.string;

void main()
{
  int N = to!int(chomp(readln()));
  string str = to!string(N);
  int count;
  foreach(char chr; str) {
    count += to!int(chr)-48;
  }
  if(N % count == 0) {
    writeln("Yes");
  } else writeln("No");

}
