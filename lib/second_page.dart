import 'package:flutter/material.dart';
import 'dart:io';
import 'strings.dart';

class SecondPage extends StatefulWidget {
  final File pickedImage;
  const SecondPage(this.pickedImage);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(preferredSize: Size.fromHeight(1.0), child: Divider(height: 1.0)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(Strings.titleSecondPage, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Image.file(widget.pickedImage,
        fit: BoxFit.cover),
      ),
    );
  }
}
