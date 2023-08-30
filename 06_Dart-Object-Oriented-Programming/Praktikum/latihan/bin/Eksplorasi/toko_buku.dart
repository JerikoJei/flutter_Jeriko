import 'dart:io';

import 'buku.dart';

void main() {
  Toko toko = Toko();

  while (true) {
    print('======Pilihan======');
    print('1. Tambah Buku');
    print('2. Lihat semua buku');
    print('3. Hapus Buku');
    print('4. Selesai');
    stdout.write('Masukkan pilihan : ');
    String pilihan = stdin.readLineSync()!;

    if (pilihan == '1') {
      stdout.write('Masukkan ID Buku : ');
      int id = int.parse(stdin.readLineSync()!);
      stdout.write('Masukkan Judul Buku : ');
      String judul = stdin.readLineSync()!;
      stdout.write('Masukkan Penerbit Buku : ');
      String penerbit = stdin.readLineSync()!;
      stdout.write('Masukkan Harga Buku : ');
      double harga = double.parse(stdin.readLineSync()!);
      stdout.write('Masukkan Kategori Buku : ');
      String kategori = stdin.readLineSync()!;

      Buku b = Buku(id, judul, penerbit, harga, kategori);
      toko.tambah(b);
    } else if (pilihan == '2') {
      toko.lihat();
    } else if (pilihan == '3') {
      stdout.write('Masukkan ID Buku yang ingin dihapus : ');
      int id = int.parse(stdin.readLineSync()!);
      toko.hapusBuku(id);
    } else if (pilihan == '4') {
      break;
    } else {
      print('Pilihan tidak valid');
    }
  }
}
