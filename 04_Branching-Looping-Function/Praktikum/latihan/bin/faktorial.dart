import 'dart:io';

int faktorial(int n) {
  int faktor = 1;
  for (int i = 1; i <= n; i++) {
    faktor *= i;
  }
  return faktor;
}

void main() {
  stdout.write('Masukkan nilai yang ingin difaktorialkan : ');
  int nilai = int.parse(stdin.readLineSync()!);

  int hasil = faktorial(nilai);
  print(hasil);
}
