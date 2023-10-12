import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  DateTime _duedate = DateTime.now();
  final currentdate = DateTime.now();
  Color _curcolor = Colors.green;

  File file = File("");
  void _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        file = File(result.files.single.name);
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  var inputController = TextEditingController();
  var inputController2 = TextEditingController();

  List<Map<String, dynamic>> contacts = [];

  late String text, text2;

  void _addContact() {
    final name = inputController.text;
    final phonenumber = inputController2.text;

    if (name.isNotEmpty && phonenumber.isNotEmpty) {
      setState(() {
        contacts.add({
          'ctc': name,
          'num': phonenumber,
          'date': _duedate,
          'color': _curcolor,
          'file': file,
        });
        inputController.clear();
        inputController2.clear();
      });
    }
  }

  void _printAllContacts() {
    for (var contact in contacts) {
      final name = contact['ctc'];
      final phoneNumber = contact['num'];
      final color = contact['color'];
      final date = contact['date'];
      final file = contact['file'];
      debugPrint(
          'Contact: {title: $name, subtitle: $phoneNumber,  date: $date, Color: $color, file: $file}');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    inputController.dispose();
    inputController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(title: const Text('Contacts')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          children: [
            const Icon(
              Icons.phone_android,
              color: Color(0Xff213555),
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
                style: GoogleFonts.roboto(
                  color: const Color(0Xff213555),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  letterSpacing: 0.25,
                  height: 1.25,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Divider(
                thickness: 1,
                color: Color(0Xff213555),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: inputController,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mohon Masukkan Nama Kontak';
                      }
                      if (value.split(' ').length < 2) {
                        return 'Nama minimal di isi 2 kata';
                      }
                      final words = value.split(' ');
                      for (final word in words) {
                        if (!RegExp(r'^[A-Z][a-z]*$').hasMatch(word)) {
                          return 'Setiap kata harus dimulai dengan huruf kapital.';
                        }
                      }
                      if (RegExp(r'[0-9!@#%^&*(),.?":{}|<>]').hasMatch(value)) {
                        return 'Nama tidak boleh mengandung angka atau karakter khusus.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: inputController2,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mohon Masukkan Nomor Telepon';
                      }
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
                    height: 20,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700, fontSize: 17),
                      ),
                      TextButton(
                        onPressed: () async {
                          final selectdate = await showDatePicker(
                            context: context,
                            initialDate: currentdate,
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now(),
                          );
                          setState(() {
                            if (selectdate != null) {
                              _duedate = selectdate;
                            }
                          });
                        },
                        child: const Text('Select Date'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Tanggal Lahir : '),
                      Text(DateFormat('dd MMMM yyyy').format(_duedate))
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    thickness: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        'Choose Color',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 40,
                    width: double.infinity,
                    color: _curcolor,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return SingleChildScrollView(
                                child: AlertDialog(
                                  title: const Text('Pick Color'),
                                  content: ColorPicker(
                                    pickerColor: _curcolor,
                                    onColorChanged: (color) {
                                      setState(() {
                                        _curcolor = color;
                                      });
                                    },
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Save Color'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(_curcolor),
                    ),
                    child: const Text('Pick Color'),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        'Pick Your Files',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(_curcolor),
                    ),
                    onPressed: () {
                      _pickFiles();
                    },
                    child: const Text('Pick and Open Files'),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF6750A4),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _addContact();
                                _printAllContacts();
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 3,
                  ),
                  Column(children: [
                    Text(
                      'List Contacts',
                      style: GoogleFonts.roboto(
                          color: const Color(0Xff213555),
                          height: 2,
                          fontWeight: FontWeight.w400,
                          fontSize: 24),
                    ),
                  ]),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      final contact = contacts[index];
                      final name = contact['ctc'];
                      final phonenum = contact['num'];
                      final born = contact['date'];
                      final color = contact['color'];
                      final file = contact['file'];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Color(0xFFEADDFF),
                            child: Text('A'),
                          ),
                          title: Text(name),
                          dense: true,
                          subtitle: Column(
                            children: [
                              Row(
                                children: [
                                  Text(phonenum),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Date = $born'),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('color = '),
                                  Container(height: 10, width: 10, color: color)
                                ],
                              ),
                              Row(
                                children: [
                                  Text('File = $file'),
                                ],
                              ),
                            ],
                          ),
                          trailing: SizedBox(
                            width: 70,
                            child: Row(children: [
                              Expanded(
                                  child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Update Contact'),
                                                actions: [
                                                  TextField(
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                'Masukkan Nama'),
                                                    onChanged: (value) {
                                                      setState(() {
                                                        text = value;
                                                      });
                                                    },
                                                  ),
                                                  TextField(
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                'Masukkan Nomor'),
                                                    onChanged: (value) {
                                                      setState(() {
                                                        text2 = value;
                                                      });
                                                    },
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(DateFormat(
                                                              'dd MMMM yyyy')
                                                          .format(_duedate)),
                                                      TextButton(
                                                        onPressed: () async {
                                                          final selectdate =
                                                              await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                currentdate,
                                                            firstDate:
                                                                DateTime(1950),
                                                            lastDate:
                                                                DateTime.now(),
                                                          );
                                                          setState(() {
                                                            if (selectdate !=
                                                                null) {
                                                              _duedate =
                                                                  selectdate;
                                                            }
                                                          });
                                                        },
                                                        child: const Text(
                                                            'Select Date'),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          setState(
                                                            () {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return SingleChildScrollView(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: const Text(
                                                                          'Pick Color'),
                                                                      content:
                                                                          ColorPicker(
                                                                        pickerColor:
                                                                            _curcolor,
                                                                        onColorChanged:
                                                                            (color) {
                                                                          setState(
                                                                              () {
                                                                            _curcolor =
                                                                                color;
                                                                          });
                                                                        },
                                                                      ),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              const Text('Save Color'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          );
                                                        },
                                                        style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStatePropertyAll(
                                                                  color),
                                                        ),
                                                        child: const Text(
                                                            'Pick Color'),
                                                      ),
                                                      const Spacer(),
                                                      ElevatedButton(
                                                        style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStatePropertyAll(
                                                                  _curcolor),
                                                        ),
                                                        onPressed: () {
                                                          _pickFiles();
                                                        },
                                                        child: const Text(
                                                            'Pick and Open Files'),
                                                      ),
                                                    ],
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        contact['ctc'] = text;
                                                        contact['num'] = text2;
                                                        contact['date'] =
                                                            _duedate;
                                                        contact['color'] =
                                                            _curcolor;
                                                        contact['file'] = file;
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                        'Update Contact'),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      icon: const Icon(Icons.edit))),
                              Expanded(
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          contacts.removeAt(index);
                                        });
                                      },
                                      icon: const Icon(Icons.delete))),
                            ]),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
