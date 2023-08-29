class Buku {
  String id;
  String judul;
  String penerbit;
  String harga;
  String kategori;

  Buku(this.id, this.judul, this.penerbit, this.harga, this.kategori);

  List<Buku> daftarBuku = [];
  void tambah(Buku buku) {
    daftarBuku.add(buku);
  }

  void hapus(Buku buku) {
    daftarBuku.remove(buku);
  }

  void lihat() {
    print('Daftar Buku yang dimiliki');
    for (var buku in daftarBuku) {
      print(
          '${buku.id}, ${buku.judul},${buku.penerbit}, ${buku.harga},${buku.kategori}');
    }
  }
}
