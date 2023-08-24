import 'dart:io';

Future<List<int>> ldata(List<int> p1, int p2) async {
  List<int> nl = [];

  for (int jlh in p1) {
    int h = jlh * p2;
    nl.add(h);
    await Future.delayed(Duration(seconds: 1));
  }
  return nl;
}

void main() async {
  List<int> hs = [];
  int n, k;
  stdout.write('Masukkan Jumlah data yang kamu inginkan? : ');
  n = int.parse(stdin.readLineSync()!);

  stdout.write('Ingin dikalikan dengan angka berapa? : ');
  k = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n; i++) {
    print('==Data Ke-${i + 1}==');
    stdout.write('Masukkan Data Ke-${i + 1} : ');
    int da = int.parse(stdin.readLineSync()!);
    hs.add(da);
  }
  print('Loading');
  List<int> hasil = await ldata(hs, k);
  print('data baru : $hasil');
  print('Berikut Hasilnya');
}
