import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praktikum/Provider/contact_provider.dart';
import 'package:praktikum/Provider/model.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  String name = '';
  String nomor = '';
  //textediting untuk nama dan nomor
  var namecontroller = TextEditingController();
  var nomorcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  //dispose untuk controler
  @override
  void dispose() {
    super.dispose();
    namecontroller.dispose();
    nomorcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactProvider =
        Provider.of<ContactProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      //appbar dengan judul contacts
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      //body dibungkus dengan listview
      body: SafeArea(
          child: ListView(padding: const EdgeInsets.all(20), children: [
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
            key: formkey,
            child:
                //textformfield untuk nama kontak
                Column(children: [
              TextFormField(
                controller: namecontroller,
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
                onChanged: (String value) {
                  name = value;
                },
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
                controller: nomorcontroller,
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
                onChanged: (String value) {
                  nomor = value;
                },
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
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        contactProvider.addContact(
                          GetContact(name: name, nomor: nomor),
                        );
                        namecontroller.clear();
                        nomorcontroller.clear();
                      }
                    },
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    child: const Text('Submit'),
                  ))
            ])),
        Consumer<ContactProvider>(builder: (context, contactProvider, _) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: contactProvider.contacts.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: ListTile(
                        title: Text(contactProvider.contacts[index].name),
                        subtitle: Text(contactProvider.contacts[index].nomor),
                        leading: const CircleAvatar(
                          child: Text('A'),
                        ),
                        trailing: SizedBox(
                            width: 70,
                            child: Row(children: [
                              Expanded(
                                  child: IconButton(
                                onPressed: () => showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Update Contact'),
                                        actions: [
                                          TextFormField(
                                            decoration: const InputDecoration(
                                                hintText: 'Masukkan Nama'),
                                            onChanged: (String value) {
                                              name = value;
                                            },
                                          ),
                                          TextFormField(
                                            decoration: const InputDecoration(
                                                hintText: 'Masukkan Nomor'),
                                            onChanged: (String value) {
                                              nomor = value;
                                            },
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                contactProvider.updateContact(
                                                    index, name, nomor);
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Submit'))
                                        ],
                                      );
                                    }),
                                icon: const Icon(Icons.edit),
                              )),
                              IconButton(
                                  onPressed: () {
                                    contactProvider.deleteContact(index);
                                  },
                                  icon: const Icon(Icons.delete))
                            ]))));
              });
        }),
      ])),
      drawer: Drawer(
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  'gallery',
                );
              },
              child: const ListTile(
                title: Text('Gallery'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('phone');
              },
              child: const ListTile(
                title: Text('Contact'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
