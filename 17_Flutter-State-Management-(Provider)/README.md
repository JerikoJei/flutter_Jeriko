# Flutter State Management (Provider)

1. State adalah data yang dapat dibaca saat pembuatan widget diaplikasi, data tersebut dapat berubah saat widget sedang aktif. untuk itu state hanya stateful widget saja. alasan diperlukannya global state adalah agar antara widget yang satu dan lain dapat memanfaatkan state yang sama dengan mudah.
2. Global state adalah state biasa yang bisa dapat digunakan pada seluruh widget diaplikasi kita.
3. Provider adalah salah satu state management yang dapat ditambahkan melalui package. perbedaan global state dengan provider adalah provider hanya mengubah 1 ui widget saja sehingga tidak perlu dibangun ulang seperti globalstate. 