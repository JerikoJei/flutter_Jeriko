import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'package:praktikum/prio2/models/state.dart';
import 'package:praktikum/prio2/provider/pic_provider.dart';
import 'package:provider/provider.dart';

class ImageGeneratorScreen extends StatefulWidget {
  const ImageGeneratorScreen({super.key});

  @override
  State<ImageGeneratorScreen> createState() => _ImageGeneratorScreenState();
}

class _ImageGeneratorScreenState extends State<ImageGeneratorScreen> {
  GlobalKey<FormState> formkey1 = GlobalKey();
  String name = '';

  TextEditingController nameco = TextEditingController();

  @override
  void initState() {
    final picProvider = Provider.of<PicProvider>(context, listen: false);

    picProvider.addListener(
      () {
        if (picProvider.myState == MyState.failed) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Image Gagal'),
          ));
        } else if (picProvider.myState == MyState.loaded) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Image Berhasil'),
          ));
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final picprovider = Provider.of<PicProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Generator'),
      ),
      body: Column(
        children: [
          Image(
            image: picprovider.image.isNotEmpty
                ? Svg(picprovider.image, source: SvgSource.network)
                : const NetworkImage(
                        'https://i.pinimg.com/originals/ae/8a/c2/ae8ac2fa217d23aadcc913989fcc34a2.png')
                    as ImageProvider,
            loadingBuilder: (context, child, progress) => progress == null
                ? child
                : const SizedBox(
                    height: 300,
                    width: 300,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            fit: BoxFit.cover,
            height: 300,
            width: 300,
          ),
          Form(
            key: formkey1,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: nameco,
                decoration: InputDecoration(
                  hintText: 'Input Your Name',
                  label: const Text('Your Name'),
                  filled: true,
                  fillColor: Colors.blueGrey.withOpacity(0.5),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (formkey1.currentState!.validate()) {
                formkey1.currentState!.save();
                name = nameco.text;
                picprovider.picture(name);
              }
            },
            child: Consumer<PicProvider>(
              builder: (context, picProvider, circular) {
                if (picProvider.myState == MyState.loading) {
                  return circular!;
                } else {
                  return const Text('Register');
                }
              },
              child: const CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
