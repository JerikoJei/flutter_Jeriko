import 'dart:io';

void main() {
  print('bilangan yang kamu inginkan:');
  int fa = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= fa; i++) {
    if (fa % i == 0) {
      print(i);
    }
  }
}
