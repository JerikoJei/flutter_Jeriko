import 'dart:io';

List<List<int>> createNestedList(int itemCount) {
  List<List<int>> dataList = [];

  for (int i = 0; i < itemCount; i++) {
    stdout.write('Masukkan data ke-$i (Sub-elemen 1): ');
    int subElement1 = int.parse(stdin.readLineSync()!);
    stdout.write('Masukkan data ke-$i (Sub-elemen 2): ');
    int subElement2 = int.parse(stdin.readLineSync()!);

    dataList.add([subElement1, subElement2]);
  }

  return dataList;
}

Map<int, int> convertListToMap(List<List<int>> dataList) {
  Map<int, int> dataMap = {};

  for (var data in dataList) {
    int key = data[0];
    int value = data[1];
    dataMap[key] = value;
  }

  return dataMap;
}

void main() {
  stdout.write('Masukkan jumlah data yang ingin dimasukkan: ');
  int itemCount = int.parse(stdin.readLineSync()!);

  List<List<int>> nestedList = createNestedList(itemCount);
  Map<int, int> dataMap = convertListToMap(nestedList);

  print('List Data:');
  for (var data in nestedList) {
    print('[${data[0]}, ${data[1]}]');
  }

  print('\nMap Data:');
  dataMap.forEach((key, value) {
    print('$key: $value');
  });
}
