class Buku {
  int id;
  String judul;
  String penerbit;
  double harga;
  String kategori;

  Buku(this.id, this.judul, this.penerbit, this.harga, this.kategori);
}

class Toko {
  List<Buku> daftarBuku = [];
  void tambah(Buku buku) {
    daftarBuku.add(buku);
  }

  void hapusBuku(int id) {
    var buku = daftarBuku.firstWhere((b) => b.id == id,
        orElse: () => Buku(-1, '', '', 0, ''));
    if (buku.id != -1) {
      daftarBuku.remove(buku);
      print('Buku berhasil dihapus.');
    } else {
      print('Buku dengan ID $id tidak ditemukan.');
    }
  }

  void lihat() {
    print('Daftar Buku yang dimiliki');
    for (var buku in daftarBuku) {
      print(
          '${buku.id}, ${buku.judul},${buku.penerbit}, ${buku.harga},${buku.kategori}');
    }
  }
}
