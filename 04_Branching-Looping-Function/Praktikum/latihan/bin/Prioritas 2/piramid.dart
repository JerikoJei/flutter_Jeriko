import 'dart:io';

void main() {
  for (int i = 0; i <= 5; i++) {
    for (int j = 5 - i; j > 0; j--) {
      stdout.write(' ');
    }
    for (int k = 0; k < i * 2 - 1; k++) {
      stdout.write('*');
    }
    print(' ');
  }
}
