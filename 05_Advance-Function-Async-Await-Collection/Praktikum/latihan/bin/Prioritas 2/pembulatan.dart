import 'dart:io';

double ave(List<double> ni) {
  double a = 0;
  for (double i in ni) {
    a += i;
  }
  double jlh = ni.length.toDouble();
  a /= jlh;
  return a;
}

void main() {
  List<double> di = [];
  stdout.write('Masukkan jumlah nilai yang di inginkan : ');
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n; i++) {
    stdout.write('Data ke${i + 1} : ');
    double da = double.parse(stdin.readLineSync()!);
    di.add(da);
  }
  double akhir = ave(di);
  print(akhir.ceilToDouble());
}
