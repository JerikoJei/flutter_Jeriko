import 'dart:io';

Future<BigInt> faktorial(int n) async {
  BigInt faktor = BigInt.one;
  for (int i = 1; i <= n; i++) {
    faktor *= BigInt.from(i);
  }
  return Future.delayed(Duration(seconds: 2), () {
    return faktor;
  });
}

void main() async {
  stdout.write('Masukkan nilai yang ingin difaktorialkan : ');
  int nilai = int.parse(stdin.readLineSync()!);
  print('Sabar hitung dulu');
  BigInt hasil = await faktorial(nilai);
  print(hasil);
  print('wes siap, makaseh dah nunggu');
}
