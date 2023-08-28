class Hewan {
  double bb;

  Hewan(this.bb);
}

class Mobil {
  double kapasitasMaksimum;
  List<Hewan> muatan = [];

  Mobil(this.kapasitasMaksimum);

  String tambahMuatan(Hewan hewan) {
    double totalBeratMuatan = 0;
    for (var h in muatan) {
      totalBeratMuatan += h.bb;
    }

    if (totalBeratMuatan + hewan.bb <= kapasitasMaksimum) {
      muatan.add(hewan);
      return "Muatan berhasil ditambahkan";
    } else {
      return "Kapasitas muatan tidak mencukupi";
    }
  }
}

void main() {
  Mobil mobil = Mobil(500.0);

  Hewan kuda = Hewan(300.0);
  Hewan rakun = Hewan(7.0);
  Hewan kucing = Hewan(6.0);
  Hewan sapi = Hewan(340);

  print(mobil.tambahMuatan(kuda));
  print(mobil.tambahMuatan(rakun));
  print(mobil.tambahMuatan(kucing));
  print(mobil.tambahMuatan(sapi));
}
