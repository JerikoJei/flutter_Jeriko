import 'dart:io';

class Calculator {
  double penjumlahan(double a, b) {
    return a + b;
  }

  double pengurangan(double a, b) {
    return a - b;
  }

  double perkalian(double a, b) {
    return a * b;
  }

  double pembagian(double a, double b) {
    double hasilBagi = 0;
    if (b == 0) {
      print('Pembagian oleh nol tidak dapat dilakukan.');
    } else {
      hasilBagi = a / b;
    }
    return hasilBagi;
  }
}

void main() {
  Calculator calculator = Calculator();

  stdout.write('Masukkan angka 1: ');
  double angka1 = double.parse(stdin.readLineSync()!);

  stdout.write('Masukkan angka 2: ');
  double angka2 = double.parse(stdin.readLineSync()!);

  stdout.write('Masukkan operasi(+, -, *, /): ');
  String operasi = stdin.readLineSync()!;

  if (operasi == '+') {
    print('hasil jumlah ${calculator.penjumlahan(angka1, angka2)}');
  } else if (operasi == '-') {
    print('hasil kurang ${calculator.pengurangan(angka1, angka2)}');
  } else if (operasi == '*') {
    print('hasil kali ${calculator.perkalian(angka1, angka2)}');
  } else if (operasi == '/') {
    print('hasil bagi ${calculator.pembagian(angka1, angka2)}');
  } else {
    print('pilihan operasi tidak valid');
  }
}
