import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore

import 'dart:io';

class AddButton extends StatefulWidget {
  final String folder;
  AddButton(this.folder);
  @override
  _AddButtonState createState() => _AddButtonState(folder);
}

class _AddButtonState extends State<AddButton> {

  final String folder;
  _AddButtonState(this.folder);

  File _image;

  Future getImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    _image = File(pickedFile.path);

    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child(folder+'/${Path.basename(_image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');

    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: getImage,
    );
  }
}
