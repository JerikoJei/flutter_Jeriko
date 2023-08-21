import 'dart:io';
import 'dart:math';

double luas(double j) {
  return pi * (j * j);
}

void main() {
  stdout.write('Masukkan nilai jari-jari lingkaran :  ');
  double nilai = double.parse(stdin.readLineSync()!);

  double hasil = luas(nilai);
  print(hasil);
}
