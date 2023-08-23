import 'dart:io';

void pri(int n) {
  if (n <= 1) {
    return print('Bukan Bilangan Prima');
  }

  for (int i = 2; i <= n / 2; i++) {
    if (n % i == 0) {
      return print('Bukan Bilangan Prima');
    }
  }
  return print('Bilangan prima');
}

void main() {
  stdout.write("Masukkan sebuah bilangan : ");
  int fa = int.parse(stdin.readLineSync()!);

  pri(fa);
}
