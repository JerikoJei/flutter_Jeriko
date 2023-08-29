import 'dart:io';

import 'buku.dart';

void main() {
  List<Buku> book = [];
  while (true) {
    print('======Pilihan======');
    print('1. Tambah Buku');
    print('2. Lihat semua buku');
    print('3. Hapus Buku');
    stdout.write('Masukkan pilihan : ');
    String pilihan = stdin.readLineSync()!;

    if (pilihan == '1') {
      stdout.write('Masukkan ID Buku');
      String id = stdin.readLineSync()!;
      stdout.write('Masukkan Judul Buku');
      String judul = stdin.readLineSync()!;
      stdout.write('Masukkan Penerbit Buku');
      String penerbit = stdin.readLineSync()!;
      stdout.write('Masukkan Harga Buku');
      String harga = stdin.readLineSync()!;
      stdout.write('Masukkan Kategori Buku');
      String kategori = stdin.readLineSync()!;

      Buku b = Buku(id, judul, penerbit, harga, kategori);
      book.add(b);
    } else if (pilihan == '2') {}
  }
}
