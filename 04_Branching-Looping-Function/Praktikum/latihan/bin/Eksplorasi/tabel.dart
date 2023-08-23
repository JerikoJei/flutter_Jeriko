import 'dart:io';

void main() {
  stdout.write('Masukkan sebuah bilangan : ');
  int fa = int.parse(stdin.readLineSync()!);
  for (int i = 1; i <= fa; i++) {
    for (int j = 1; j <= fa; j++) {
      stdout.write(j * i);
      stdout.write(' ');
    }
    print('');
  }
}
