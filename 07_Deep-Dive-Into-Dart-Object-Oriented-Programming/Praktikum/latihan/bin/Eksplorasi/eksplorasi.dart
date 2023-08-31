import 'dart:math';

class Shape {
  getArea() {}
  getPerimeter() {}
}

class Circle implements Shape {
  late int radius;
  @override
  getArea() {
    return pi * radius * radius;
  }

  @override
  getPerimeter() {
    return 2 * pi * radius;
  }
}

class Square implements Shape {
  late int sisi;

  @override
  getArea() {
    return sisi * sisi;
  }

  @override
  getPerimeter() {
    return 4 * sisi;
  }
}

class Rectangle implements Shape {
  late int lebar;
  late int panjang;
  @override
  getArea() {
    return panjang * lebar;
  }

  @override
  getPerimeter() {
    return 2 * (panjang + lebar);
  }
}

void main() {
  Circle circle = Circle();
  circle.radius = 8;
  print('Luas Lingkaran adalah : ${circle.getArea()}');
  print('Keliling Lingkaran adalah : ${circle.getPerimeter()}');

  Square square = Square();
  square.sisi = 6;
  print('Luas Persegi adalah : ${square.getArea()}');
  print('Keliling Persegi adalah : ${square.getPerimeter()}');

  Rectangle rectangle = Rectangle();
  rectangle.panjang = 10;
  rectangle.lebar = 7;
  print('Luas Lingkaran adalah : ${rectangle.getArea()}');
  print('Keliling Lingkaran adalah : ${rectangle.getPerimeter()}');
}
