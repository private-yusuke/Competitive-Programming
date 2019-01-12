import std.stdio, std.algorithm;

void main()
{
  int[] list = [2, 3, 4, 2, 3, 4, 1, 2, 9, 2];
  sort!("a < b")(list);
  writeln(list);
  int left = 0, right = list.length-1, middle;
  int key = 4;

  while(left < right) {
    writeln(left, middle, right);
    middle = int((left + right) / 2);
    if(list[middle] == key) {
      writeln("found: ", middle);
      break;
    } else if(key < list[middle]) {
      right = middle;
    } else {
      left = middle + 1;
    }
  }
}
