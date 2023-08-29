import 'course.dart';
import 'student.dart';
import 'dart:io';

void main() {
  Student student1 = Student('Dafan', '10');

  Course flutter = Course('Flutter', 'belajar flutter dari dasar');
  Course matematika = Course('Matematika', 'belajar matematika dari dasar');
  print('====Daftar Siswa====');
  print('1. Dafan');

  stdout.write('Masukkan pilihan Anda : ');
  String pilihan = stdin.readLineSync()!;

  if (pilihan == '1') {
    while (true) {
      print('\n1. Tambah Course');
      print('2. Lihat Daftar Course');
      print('3. Hapus Course');
      print('4. Selesai');
      stdout.write('Pilih tindakan: ');
      String tindakan = stdin.readLineSync()!;

      if (tindakan == '1') {
        print('\n===List Course Tersedia===');
        print('1. ${flutter.judul}, ${flutter.deskripsi}');
        print('2. ${matematika.judul}, ${matematika.deskripsi}');
        stdout.write('Masukkan course yang ingin ditambahkan : ');
        String course = stdin.readLineSync()!;

        if (course == '1') {
          student1.tambah(flutter);
        } else if (course == '2') {
          student1.tambah(matematika);
        }
      } else if (tindakan == '2') {
        student1.lihat();
      } else if (tindakan == '3') {
        print('\n===List Course Tersedia===');
        student1.lihat();
        stdout.write('Masukkan course yang ingin dihapus : ');
        String course = stdin.readLineSync()!;
        if (course == '1') {
          student1.hapus(flutter);
        } else if (course == '2') {
          student1.hapus(matematika);
        }
      } else if (tindakan == '4') {
        break;
      }
    }
  }
}
