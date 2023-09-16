import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _duedate = DateTime.now();
  final currentdate = DateTime.now();
  Color _curcolor = Colors.green;
  void _pickFiles() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openfiles(file);
  }

  void _openfiles(PlatformFile file) {
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _curcolor,
        title: const Text('Interactive Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ///Date Picker
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Date'),
                  TextButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(_curcolor)),
                    onPressed: () async {
                      final selectDate = await showDatePicker(
                        context: context,
                        initialDate: currentdate,
                        firstDate: DateTime(1940),
                        lastDate: DateTime(currentdate.year + 5),
                      );
                      setState(
                        () {
                          if (selectDate != null) {
                            _duedate = selectDate;
                          }
                        },
                      );
                    },
                    child: const Text('Select'),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              const Text('You pick : '),
              Text(
                DateFormat('dd MMMM yyyy').format(_duedate),
              ),
            ],
          ),

          ///divider
          const Divider(
            thickness: 3,
          ),
          const Text('Your Apps Theme Color'),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: _curcolor,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ///BlockPicker
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
                              content: BlockPicker(
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
              const Spacer(),

              ///ColorPicker
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
              const Spacer(),

              ///SlidePicker
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
                              content: SlidePicker(
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
            ],
          ),
          const Divider(
            thickness: 3,
          ),
          const Text('Pick Your Files'),
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
        ],
      ),
    );
  }
}
