import 'package:flutter/material.dart';

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
                height: 500,
                width: 350,
                child: FittedBox(
                  child: Image.asset(img),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 8,),
              Container(
                child: Text(
                  '  '+txt+'  ',
                  style: TextStyle(fontSize: 20),
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
              SizedBox(height: 8,)
            ],
          ),
        ),
      ),
    );
  }
}
