class BangunRuang {
  late double panjang;
  late double lebar;
  late double tinggi;

  void volume() {}
}

class Kubus extends BangunRuang {
  late double sisi;

  @override
  double volume() {
    return sisi * sisi * sisi;
  }
}

class Balok extends BangunRuang {
  @override
  double volume() {
    return panjang * lebar * tinggi;
  }
}

void main() {
  Kubus kubus = Kubus();
  Balok balok = Balok();

  kubus.sisi = 10;
  balok.panjang = 9;
  balok.lebar = 4;
  balok.tinggi = 5;

  print('Volume Kubus : ${kubus.volume()}');
  print('Volume Balok : ${balok.volume()}');
}
