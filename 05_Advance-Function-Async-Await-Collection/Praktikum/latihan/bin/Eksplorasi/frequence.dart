import 'dart:io';

void main() {
  List data = [];
  String dataa;
  int n;

  stdout.write('Masukkan jumlah data unik yang di inginkan? : ');
  n = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < n; i++) {
    stdout.write('Masukkan Data ke ${i + 1} : ');
    dataa = stdin.readLineSync()!;

    data.add(dataa);
  }
  final Map jumlahdata = {};

  for (var da in data) {
    if (jumlahdata.containsKey(da)) {
      jumlahdata[da] += 1;
    } else {
      jumlahdata[da] = 1;
    }
  }

  print("List: $data");
  print("Jumlah kemunculan setiap data:");
  for (var entry in jumlahdata.entries) {
    String kata = entry.key;
    var count = entry.value;
    print("$kata: $count kali");
  }
}
