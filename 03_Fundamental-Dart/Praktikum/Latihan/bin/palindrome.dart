import 'dart:io';

void main() {
  print('Silahkan masukkan sebuah kata');
  String? kata = stdin.readLineSync();
  String? balik = kata!.split('').reversed.join('');

  if (kata == balik) {
    print('kata ini merupakan palindrome');
    print(
        'Penjelasan: kata $kata jika dibalik adalah $balik sehingga kata ini merupakan kata palindrome');
  } else {
    print('kata ini bukan palindrome');
    print(
        'Penjelasan: kata $kata jika dibalik adalah $balik sehingga kata ini bukan palindrome karena ketika dibalik cara membacanya menjadi berbeda.');
  }
}
