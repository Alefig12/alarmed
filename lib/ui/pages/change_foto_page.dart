// ignore_for_file: prefer_const_constructors
import 'dart:ffi';
import 'dart:io';
import 'package:alarmed/ui/widgets/roundedbox_widget.dart';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'dart:math' as math;

class ChangeFotoPage extends StatefulWidget {
  const ChangeFotoPage({Key? key}) : super(key: key);

  @override
  State<ChangeFotoPage> createState() => _ChangeFotoPageState();
}

class _ChangeFotoPageState extends State<ChangeFotoPage> {
  XFile? imageFile;
  final ImagePicker _picker = ImagePicker();

  _openGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = image;
    });
    Navigator.of(context).pop();
  }

  _openCamera() async {
    try {
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      this.setState(() {
        imageFile = photo;
      });
      Navigator.of(context).pop();
    } catch (e) {
      // TODO
    }
  }

  Widget _decideImageView() {
    if (imageFile == null) {
      return CircleAvatar(
        radius: 100,
        backgroundColor: Colors.brown.shade800,
        child: const Text('AH'),
      );
    } else {
      File image = File(imageFile!.path);
      return Container(
        child: Image.file(image, width: 200, height: 200),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Expanded(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Alarmed",
              textAlign: TextAlign.center,
              style: TextStyle(color: Constant.title, fontSize: 40),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Center(
                child: MainRoundedBox(
                  width: 320,
                  color: Constant.secondCont,
                  child: Column(children: [
                    Text(
                      "Escoge tu foto de perfil",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    _decideImageView(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      // ignore: sort_child_properties_last
                      children: [
                        Column(children: [
                          RoundTextButton(
                            color: Constant.secondCont4,
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: Constant.secondCont3,
                              size: 40,
                            ),
                            onPressed: () {
                              _openCamera();
                            },
                          ),
                          Text("Camara",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))
                        ]),
                        SizedBox(
                          width: 20,
                        ),
                        Column(children: [
                          RoundTextButton(
                            color: Constant.secondCont4,
                            child: Icon(
                              Icons.photo,
                              color: Constant.secondCont3,
                              size: 40,
                            ),
                            onPressed: () {
                              _openGallery();
                            },
                          ),
                          Text("Galeria",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))
                        ])
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            RoundTextButton(
              child: Text("Siguiente",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              color: Constant.mainCont2,
              width: 200,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Omitir",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    ));
  }
}
