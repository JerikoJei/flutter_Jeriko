import 'dart:io';

void main() {
  for (int i = 1; i <= 5; i++) {
    for (int j = 1; j < i; j++) {
      stdout.write(' ');
    }
    for (int k = 1; k <= 2 * (5 - i) + 1; k++) {
      stdout.write('*');
    }
    print('');
  }
  for (int i = 5; i > 1; i--) {
    for (int j = 1; j <= i; j++) {
      stdout.write(' ');
    }
    for (int k = 1; k <= 2 * (5 - i) + 1; k++) {
      stdout.write('*');
    }
    print('');
  }
}
