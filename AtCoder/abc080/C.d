import std.stdio, std.conv, std.string;

void main()
{
  int N = to!int(chomp(readln()));

  int[][] eigyo;
  int[][] rieki;

  for(int i = 0; i < N; i++) {
    string[] a = split(readln());
    foreach(string str; a) {
      eigyo[i] ~= to!int(str);
    }
  }
  writeln(eigyo);
}
