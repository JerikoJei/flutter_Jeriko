import 'dart:io';

void main() {
  int nilai;
  String nHuruf;
  stdout.write('Masukkan nilai : ');
  nilai = int.parse(stdin.readLineSync()!);
  if (nilai > 70) {
    nHuruf = 'A';
  } else if (nilai > 40) {
    nHuruf = 'B';
  } else if (nilai > 0) {
    nHuruf = 'C';
  } else {
    nHuruf = ' ';
  }
  print('Nilai huruf Anda adalah : $nHuruf');
}
