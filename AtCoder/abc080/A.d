import std.stdio, std.conv, std.string;

void main()
{
  string[] inputs = split(readln());
  int N = to!int(inputs[0]);
  int A = to!int(inputs[1]);
  int B = to!int(inputs[2]);

  int time_charge = A * N;
  writeln(time_charge < B ? time_charge : B);
}
