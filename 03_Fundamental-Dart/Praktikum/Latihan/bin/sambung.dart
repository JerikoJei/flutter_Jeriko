import 'dart:io';

void main() {
  String satu, dua, tiga;
  print('masukkan nama anda');
  satu = stdin.readLineSync()!;
  print('masukkan usia anda');
  dua = stdin.readLineSync()!;
  print('masukkan pelajaran yang sedang anda pelajari');
  tiga = stdin.readLineSync()!;

  print(
      'nama saya $satu, saya tahun ini berusia $dua tahun, dan sekarang saya sedang mempelajari pelajaran $tiga');
}
