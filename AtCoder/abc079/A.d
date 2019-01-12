import std.stdio, std.string;

void main() {
	string input = chomp(readln());
	
	char lastChar = ' ';
	byte count = 1;
	
	foreach(char i; input) {
		if(lastChar == ' ') {
			lastChar = i;
			continue;
		}
		if(lastChar == i) {
			count++;
		} else {
			count = 1;
			lastChar = i;
		}
		if(count >= 3) {
			writeln("Yes");
			return;
		}
	}
	
	writeln("No");
	return;
}
