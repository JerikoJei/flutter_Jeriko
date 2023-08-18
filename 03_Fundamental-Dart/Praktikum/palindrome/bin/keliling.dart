import 'dart:io';
import 'dart:math';

void persegi(double k, l) {
  print('Masukkan nilai sisi');
  double sisi = double.parse(stdin.readLineSync()!);
  k = 4 * sisi;
  l = sisi * sisi;

  print('keliling dari persegi anda adalah $k');
  print('luas dari persegi anda adalah $l');
}

void persegipanjang(double k, l) {
  print('Masukkan nilai panjang');
  double p = double.parse(stdin.readLineSync()!);
  print('Masukkan nilai lebar');
  double lb = double.parse(stdin.readLineSync()!);
  k = 2 * (p + lb);
  l = p * lb;

  print('keliling dari persegi panjang anda adalah $k');
  print('luas dari persegi panjang anda adalah $l');
}

void lingkaran(double k, l) {
  print('Masukkan nilai jari-jari');
  double j = double.parse(stdin.readLineSync()!);
  k = 2 * pi * j;
  l = pi * (j * j);

  print('keliling dari lingkaran anda adalah $k');
  print('luas dari lingkaran anda adalah $l');
}

void main() {
  print(
      'pilih dengan angka keliling dan luas yang ingin di hitung\n1. Persegi\n2. Persegi Panjang\n3. Lingkaran');
  String? balik = stdin.readLineSync();
  if (balik == '1') {
    persegi(0, 0);
  } else if (balik == '2') {
    persegipanjang(0, 0);
  } else if (balik == '3') {
    lingkaran(0, 0);
  }
}
