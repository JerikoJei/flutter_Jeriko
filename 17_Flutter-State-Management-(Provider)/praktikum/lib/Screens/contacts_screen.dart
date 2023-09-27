import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  //textediting untuk nama dan nomor
  var name = TextEditingController();
  var nomor = TextEditingController();

  //map list untuk nama dan nomor
  List<Map<String, dynamic>> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appbar dengan judul contacts
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      //body dibungkus dengan listview
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(
            Icons.phone_android,
          ),
          Center(
            child: Text(
              'Create New Contacts',
              style: GoogleFonts.roboto(
                  color: const Color(0Xff213555),
                  height: 2,
                  fontWeight: FontWeight.w400,
                  fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
            style: GoogleFonts.roboto(
              color: const Color(0Xff213555),
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: 0.25,
              height: 1.25,
            ),
          ),
          const Divider(
            thickness: 1,
            color: Color(0Xff213555),
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            child:
                //textformfield untuk nama kontak
                Column(
              children: [
                TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFE7E0EC),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                    label: Text('Name'),
                    hintText: 'Insert Your Name',
                  ),
                  //validator untuk nama
                  validator: (value) {
                    //validasi nama kontak tidak kosong
                    if (value == null || value.isEmpty) {
                      return 'Mohon Masukkan Nama Kontak';
                    }
                    //validasi nama harus 2 kata
                    if (value.split(' ').length < 2) {
                      return 'Nama minimal di isi 2 kata';
                    }
                    // validasi nama harus dimulai dengan huruf kapital
                    final words = value.split(' ');
                    for (final word in words) {
                      if (!RegExp(r'^[A-Z][a-z]*$').hasMatch(word)) {
                        return 'Setiap kata harus dimulai dengan huruf kapital.';
                      }
                    }
                    // validasi nama tidak boleh ada angka
                    if (RegExp(r'[0-9!@#%^&*(),.?":{}|<>]').hasMatch(value)) {
                      return 'Nama tidak boleh mengandung angka atau karakter khusus.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                // textformfield untuk nomor
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: nomor,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFE7E0EC),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                    label: Text('Nomor'),
                    hintText: '+62.....',
                  ),
                  // validasi untuk nomor
                  validator: (value) {
                    // validasi nomor tidak kosong
                    if (value == null || value.isEmpty) {
                      return 'Mohon Masukkan Nomor Telepon';
                    }
                    //validasi nomor harus hanya angka
                    if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
                      return 'Nomor telepon harus terdiri dari angka saja.';
                    }
                    // Validasi panjang nomor telepon
                    if (value.length < 8 || value.length > 15) {
                      return 'Panjang nomor telepon harus minimal 8 digit dan maksimal 15 digit.';
                    }
                    // Validasi nomor telepon harus dimulai dengan angka 0
                    if (!RegExp(r'^0').hasMatch(value)) {
                      return 'Nomor telepon harus dimulai dengan angka 0.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    child: const Text('Submit'),
                  ),
                )
              ],
            ),
          ),
          ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return const ListTile(
                leading: CircleAvatar(
                  child: Text('A'),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
