import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../pages/messages.dart';
import 'auth.dart';


class Message{
  final String from, message;
  DateTime time;
  Message(this.from, this.message){
    time=DateTime.now();
  }
}

void addMessageToDatabase(Message m){
  Firestore.instance.collection('messages').document()
      .setData({ 'from': m.from, 'message': m.message, 'time': m.time });
}

class MessageTiles extends StatelessWidget {

  final String from;
  final String message;
  final Timestamp time;
  MessageTiles(this.message,this.time,this.from);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: from==userName ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Card(
            elevation: 3,
            color: Colors.deepOrange.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              child: Column(
                crossAxisAlignment: from==userName ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    from,
                    style: TextStyle(color: Colors.deepOrange.shade700, fontSize: 22, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    message,
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  Text(
                    time.toDate().hour>12?
                    (time.toDate().hour-12).toString() + " : " + time.toDate().minute.toString()+' pm'
                        :time.toDate().hour.toString() + " : " + time.toDate().minute.toString()+' am',
                    style: TextStyle(color: Colors.black45, fontSize: 15),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
