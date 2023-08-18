import 'dart:io';

void main() {
  print('Silahkan masukkan sebuah kata');
  String? kata = stdin.readLineSync();
  String? balik = kata!.split('').reversed.join('');

  if (kata == balik) {
    print('kata ini merupakan palindrome');
  } else {
    print('kata ini bukan palindrome');
  }
}
