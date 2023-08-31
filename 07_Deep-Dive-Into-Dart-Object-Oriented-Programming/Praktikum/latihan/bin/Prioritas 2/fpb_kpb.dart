class Matematika {
  hasil() {}
}

class KPK implements Matematika {
  late int x;
  late int y;

  @override
  hasil() {
    int max = (x > y) ? x : y;
    while (true) {
      if (max % x == 0 && max % y == 0) {
        return max;
      }
      max++;
    }
  }
}

class FPB implements Matematika {
  late int x;
  late int y;

  @override
  hasil() {
    while (y != 0) {
      int temp = y;
      y = x % y;
      x = temp;
    }

    int fpb = x;
    return fpb;
  }
}

void main() {
  KPK kpb = KPK();
  FPB fpb = FPB();
  kpb.x = 20;
  kpb.y = 30;

  fpb.x = 20;
  fpb.y = 30;

  print('Hasil KPB : ${kpb.hasil()}');
  print('Hasil FPB : ${fpb.hasil()}');
}
