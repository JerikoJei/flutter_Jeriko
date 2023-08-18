import 'dart:io';
import 'dart:math';

void main() {
  double silinder;

  print('masukkan nilai jari-jari');
  double j = double.parse(stdin.readLineSync()!);
  print('masukkan nilai tinggi');
  double t = double.parse(stdin.readLineSync()!);

  silinder = pi * (j * j) * t;
  print('nilai volume silinder anda adalah = $silinder');
}
