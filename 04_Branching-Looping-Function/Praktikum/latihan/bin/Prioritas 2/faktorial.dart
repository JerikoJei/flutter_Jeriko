import 'dart:io';

BigInt faktorial(int n) {
  BigInt faktor = BigInt.one;
  for (int i = 1; i <= n; i++) {
    faktor *= BigInt.from(i);
  }
  return faktor;
}

void main() {
  stdout.write('Masukkan nilai yang ingin difaktorialkan : ');
  int nilai = int.parse(stdin.readLineSync()!);

  BigInt hasil = faktorial(nilai);
  print(hasil);
}
