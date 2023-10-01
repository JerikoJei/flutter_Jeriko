import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praktikum/Model/contacts_model.dart';
import 'package:praktikum/bloc/contacts_bloc.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  String nama = '';
  String number = '';

  //textediting untuk nama dan nomor
  var namecontroller = TextEditingController();
  var nomorcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var formkey2 = GlobalKey<FormState>();

  //dispose untuk controler
  @override
  void dispose() {
    super.dispose();
    namecontroller.dispose();
    nomorcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appbar dengan judul contacts
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      //body dibungkus dengan listview
      body: BlocBuilder<ContactsBloc, ContactsState>(
        builder: (context, state) {
          return SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
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
                        nama = value;
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
                        if (RegExp(r'[0-9!@#%^&*(),.?":{}|<>]')
                            .hasMatch(value)) {
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
                        number = value;
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
                            GetContact contacts =
                                GetContact(name: nama, nomor: number);
                            if (formkey.currentState!.validate()) {
                              context
                                  .read<ContactsBloc>()
                                  .add(AddContact(contact: contacts));
                              namecontroller.clear();
                              nomorcontroller.clear();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder()),
                          child: const Text('Submit'),
                        ))
                  ])),
              BlocConsumer<ContactsBloc, ContactsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.contacts.length,
                        itemBuilder: (context, index) {
                          final contact = state.contacts[index];
                          return Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: ListTile(
                                  title: Text(contact.name),
                                  subtitle: Text(contact.nomor),
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
                                                  return Form(
                                                    key: formkey2,
                                                    child: AlertDialog(
                                                      title: const Text(
                                                          'Update Contact'),
                                                      actions: [
                                                        TextFormField(
                                                          controller:
                                                              TextEditingController(
                                                                  text: contact
                                                                      .name),
                                                          decoration:
                                                              const InputDecoration(
                                                                  hintText:
                                                                      'Masukkan Nama'),
                                                          onChanged:
                                                              (String value) {
                                                            nama = value;
                                                          },
                                                          validator: (value) {
                                                            //validasi nama kontak tidak kosong
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Mohon Masukkan Nama Kontak';
                                                            }
                                                            //validasi nama harus 2 kata
                                                            if (value
                                                                    .split(' ')
                                                                    .length <
                                                                2) {
                                                              return 'Nama minimal di isi 2 kata';
                                                            }
                                                            // validasi nama harus dimulai dengan huruf kapital
                                                            final words = value
                                                                .split(' ');
                                                            for (final word
                                                                in words) {
                                                              if (!RegExp(
                                                                      r'^[A-Z][a-z]*$')
                                                                  .hasMatch(
                                                                      word)) {
                                                                return 'Setiap kata harus dimulai dengan huruf kapital.';
                                                              }
                                                            }
                                                            // validasi nama tidak boleh ada angka
                                                            if (RegExp(
                                                                    r'[0-9!@#%^&*(),.?":{}|<>]')
                                                                .hasMatch(
                                                                    value)) {
                                                              return 'Nama tidak boleh mengandung angka atau karakter khusus.';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                        TextFormField(
                                                          controller:
                                                              TextEditingController(
                                                                  text: contact
                                                                      .nomor),
                                                          decoration:
                                                              const InputDecoration(
                                                                  hintText:
                                                                      'Masukkan Nomor'),
                                                          onChanged:
                                                              (String value) {
                                                            number = value;
                                                          },
                                                          validator: (value) {
                                                            // validasi nomor tidak kosong
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Mohon Masukkan Nomor Telepon';
                                                            }
                                                            //validasi nomor harus hanya angka
                                                            if (!RegExp(
                                                                    r'^[0-9]*$')
                                                                .hasMatch(
                                                                    value)) {
                                                              return 'Nomor telepon harus terdiri dari angka saja.';
                                                            }
                                                            // Validasi panjang nomor telepon
                                                            if (value.length <
                                                                    8 ||
                                                                value.length >
                                                                    15) {
                                                              return 'Panjang nomor telepon harus minimal 8 digit dan maksimal 15 digit.';
                                                            }
                                                            // Validasi nomor telepon harus dimulai dengan angka 0
                                                            if (!RegExp(r'^0')
                                                                .hasMatch(
                                                                    value)) {
                                                              return 'Nomor telepon harus dimulai dengan angka 0.';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            if (formkey2
                                                                .currentState!
                                                                .validate()) {
                                                              context
                                                                  .read<
                                                                      ContactsBloc>()
                                                                  .add(UpdateContact(
                                                                      name:
                                                                          nama,
                                                                      index:
                                                                          index,
                                                                      nomor:
                                                                          number));
                                                              Navigator.pop(
                                                                  context);
                                                            }
                                                          },
                                                          child: const Text(
                                                              'Submit'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }),
                                            icon: const Icon(Icons.edit),
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              context.read<ContactsBloc>().add(
                                                  DeleteContact(index: index));
                                            },
                                            icon: const Icon(Icons.delete))
                                      ]))));
                        }),
                  );
                },
              ),
            ]),
          ));
        },
      ),
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
