import std.stdio, std.string, std.algorithm;

void main()
{
  char[] input = chomp(readln()).dup;
  char[] input2 = chomp(readln()).dup;

  swap(input[0], input[2]);
  if(input == input2) {
    writeln("YES");
    return;
  } else {
    writeln("NO");
    return;
  }
}
