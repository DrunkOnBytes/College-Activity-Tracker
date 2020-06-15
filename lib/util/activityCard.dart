import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class ActivityCard extends StatelessWidget {

  final String txt,img;
  ActivityCard(this.txt,this.img);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 450,
                width: 350,
                child: FittedBox(
                  child: Image.network(img),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 8,),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    '  '+txt+'  ',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.red.shade700,
                      width: 2.5
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(50.0) //                 <--- border radius here
                  ),
                ),
              ),
              SizedBox(height: 3,)
            ],
          ),
        ),
      ),
    );
  }
}

class ActivityCards extends StatefulWidget {
  final String folder;
  ActivityCards(this.folder);
  @override
  _ActivityCardsState createState() => _ActivityCardsState(folder);
}

class _ActivityCardsState extends State<ActivityCards> {
  final String folder;
  List<Widget> activityTiles;

  _ActivityCardsState(this.folder);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection(folder).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');

        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            activityTiles = List<Widget>();
            for (DocumentSnapshot document in snapshot.data.documents) {
              activityTiles.add(
                  ActivityCard(document['txt'], document['img']));
            }
            if (activityTiles.length==0) {
              activityTiles.add(
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'No Activities Posted Yet',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ));
            }
            return new SingleChildScrollView(
              child: Column(
                children: activityTiles,
              ),
            );
        }
      },
    );
  }
}
