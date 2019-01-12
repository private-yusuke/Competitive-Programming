import std.stdio, std.conv, std.string, std.math;

void main()
{
  int input = to!int(chomp(readln()));
  int i = 1;
  if(input==1) {
    writeln(1);
    return;
  }
  while (pow(i, 2) <= input) {
    i++;
  }
  writeln(pow(i-1, 2));
}
