# MVVM Architecture

1. MVVM Architecture merupakan Model, view, viewmodel yang berfungsi memisahkan logic dengan tampilan (View) ke dalam viewmodel
2. keuntungan dari MVVM adalah reuseable yang dimana kode viewmodel dapat digunakan berulang-ulang, lalu maintainability dimana mudah dirawat karena pekerjaan terkait tampilan tidak tertumpuk bersama logic, lalu testability pengujian menjadi terpisah antara pengujian tampilan dengan pengujian logic sehingga dapat meningkatkan produktivitas pada pengujian.
3. Model memiliki 2 bagian, yaitu bentuk data yang akan digunakan. Model merupakan bentuk data yang akan digunakan, dibuat dalam bentuk class, viewmodel menyimpan data-data dan logic yang diperlukan halaman. lalu view menggunakan stf.