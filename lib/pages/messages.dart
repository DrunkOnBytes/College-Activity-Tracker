import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/messageUtil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../util/auth.dart';
class Messages extends StatefulWidget {

  static const routeName = '/messages';
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {

  _MessagesState();
  List<Widget> messageTiles;
  String message;
  final _messageFormKey = new GlobalKey<FormState>();

  bool validateAndSave() {
    final form = _messageFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Widget messageInput(){
    return new Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Form(
                key: _messageFormKey,
                child: TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 5,
                  decoration: new InputDecoration(
                      hintText: ' Enter Message......',
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.message,
                          color: Colors.grey,
                        ),
                      )),
                  validator: (value) => value.isEmpty ? 'Message can\'t be empty' : null,
                  onSaved: (value) => message = value,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              color: Colors.grey,
              tooltip: 'Send Message to database',
              onPressed: (){
                if(validateAndSave()){
                    setState(() {
                      var m = Message(userName, message);
                      addMessageToDatabase(m);
                      _messageFormKey.currentState.reset();
                    });
                }
              },
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red.shade700, Colors.deepOrange.shade400],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "Discussion Board",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: ScreenUtil.instance.setSp(22.0),
                color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('messages').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');

                switch (snapshot.connectionState) {
                  case ConnectionState.waiting: return new Text('Loading...');
                  default:
                    messageTiles = List<Widget>();
                    messageTiles.add(SizedBox(height: 10,));
                    for (DocumentSnapshot document in snapshot.data.documents){
                      messageTiles.add(MessageTiles(
                            document['message'], document['time'], document['from']));
                    }
                    messageTiles.add(SizedBox(height: 70,));
                    return new SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        children: messageTiles,
                      ),
                    );
                }
              },
            ),
            Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  child: messageInput(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
