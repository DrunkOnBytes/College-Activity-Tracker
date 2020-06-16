import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'auth.dart';
// For File Upload To Firestore

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

  String description;
  final _formKey = new GlobalKey<FormState>();
  File _image;

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void showPoUp(){
    Alert(
      context: context,
      type: AlertType.info,
      title: "ADD ACTIVITY",
      content: Center(
        child: Form(
          key: _formKey,
          child: TextFormField(
            autofocus: false,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 2,
            decoration: new InputDecoration(
                hintText: 'Enter Description...',
                ),
            validator: (value) => value.isEmpty ? 'Description can\'t be empty' : null,
            onSaved: (value) => description = value,
          ),
        ),
      ),
      buttons: [
        DialogButton(
          color: Colors.red,
          child: Text(
            "Add Image",
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            getImage();
          },
          width: 120,
        ),
        DialogButton(
          color: Colors.red,
          child: Text(
            "SUBMIT",
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            submitActivity();
            Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();
  }


  Future getImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    _image = File(pickedFile.path);
  }

  Future submitActivity() async{
    if(validateAndSave() && _image!=null){
      StorageTaskSnapshot snapshot = await FirebaseStorage.instance
          .ref()
          .child(folder)
          .child('${Path.basename(_image.path)}')
          .putFile(_image)
          .onComplete;

      final String downloadUrl = await snapshot.ref.getDownloadURL();

      Firestore.instance.collection(folder).document(DateTime.now().toString())
          .setData({ 'txt': description, 'img': downloadUrl, 'from': userEmail});

      print('File Uploaded');
      _image = null;
      _formKey.currentState.reset();
      setState(() {
      });
    }
    else{
      final snackBar = SnackBar(
          content: Text('Description or Image missing!'),
          duration: Duration(seconds: 1, milliseconds: 500),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: showPoUp,
    );
  }
}
