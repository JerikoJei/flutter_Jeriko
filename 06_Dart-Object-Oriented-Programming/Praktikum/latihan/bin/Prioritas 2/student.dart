import 'course.dart';

class Student {
  String nama;
  String kelas;
  List<Course> daftarCourse = [];

  Student(this.nama, this.kelas);

  void tambah(Course course) {
    daftarCourse.add(course);
  }

  void hapus(Course course) {
    daftarCourse.remove(course);
  }

  void lihat() {
    print('Daftar Course yang dimiliki');
    for (var course in daftarCourse) {
      print('${course.judul} : ${course.deskripsi}');
    }
  }
}
