import 'dart:io';

List ndup(int n) {
  List inp = [];
  for (int i = 0; i < n; i++) {
    stdout.write('Masukkan data unik : ');
    String dtunik = stdin.readLineSync()!;

    inp.add(dtunik);
  }
  List out = inp.toSet().toList();

  print(out);
  return out;
}

void main() {
  stdout.write('Ingin memasukkan berapa data unik? : ');
  int n = int.parse(stdin.readLineSync()!);
  ndup(n);
}
