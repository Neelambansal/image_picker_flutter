import 'package:flutter/material.dart';
import 'strings.dart';
import 'dart:io';
import 'dart:core';
import 'package:image_picker/image_picker.dart';
import 'package:image_flutter_project/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: Strings.titleMainPage),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image = File("");
  final picker = ImagePicker();

  // image picker function to pick image from Gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SecondPage(_image)));
      }
    });
  }

  // image picker function to get image from Camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SecondPage(_image)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
            style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  getImageFromCamera();
                },
                child: const Text(Strings.titleCamera,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            const SizedBox(height: 80.0),
            ElevatedButton(
                onPressed: () {
                  getImageFromGallery();
                },
                child: const Text(Strings.titleGallery,
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }
}
