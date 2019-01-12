import std.stdio, std.conv, std.string, std.algorithm, std.range;

void main() {
  int part_amount = to!int(chomp(readln()));
  int[][3] parts;
  for(int i = 0; i < 3; i++) {
    string[] input = split(readln());
    for(int j = 0; j < part_amount; j++) {
      parts[i] ~= to!int(input[j]);
    }
    sort!("a < b")(parts[i]);
  }
  int count;
  writeln(parts);
  for(int i = 0; i < part_amount; i++) {
    int topNum = binarysearch(parts[0], parts[1][i]);
    int bottomNum = binarysearch(parts[2], parts[1][i]);
    count += topNum * bottomNum;
    writeln(topNum);
    writeln(bottomNum);
  }
  writeln(count);
}

int binarysearch(int[] list, int num) {
  int left = 0, right = list.length-1;
  int middle;

  while(left < right) {
    middle = int((left+right)/2);
    if(list[middle] == num) {
      return middle;
    } else if(num < list[middle]) {
      right = middle;
    } else {
      left = middle + 1;
    }
  }
  writeln("AAA");
  return 0;
}
