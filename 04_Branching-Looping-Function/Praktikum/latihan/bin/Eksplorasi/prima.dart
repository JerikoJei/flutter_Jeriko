import 'dart:io';

bool pri(int n) {
  if (n <= 1) {
    return false;
  }

  for (int i = 2; i <= n / 2; i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  stdout.write("Masukkan sebuah bilangan : ");
  int fa = int.parse(stdin.readLineSync()!);

  if (pri(fa)) {
    print('bilangan prima');
  } else {
    print('bukan bilangan prima');
  }
}
