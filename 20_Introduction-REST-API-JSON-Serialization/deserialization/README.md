# Introduction REST API 

1. REST API merupakan Arsitektural yang memisahkan tampilan dengan proses bisnis, bagian tampilan dengan proses bisnis berkirim data melalui HTTP Request. HTTP merupakan protokol yang digunakan untuk berkirim data pada internet, biasanya data tersebut berbentuk media web. Struktur Request terdiri dari URL, METHOD, Header, dan Body, Struktur response terdiri status code, header dan body.
2. Dio merupakan package sebagai HTTP Client, yang dimanfaatkan untuk melakukan REST API.
3. Serialisasi JSON mengubah struktur data ke bentuk JSON menggunakan function jsonEncode, Deserialisasi JSON mengubah bentuk JSON ke Struktur data menggunakan function jsonDecode.