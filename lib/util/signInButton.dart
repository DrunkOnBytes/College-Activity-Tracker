import 'package:flutter/material.dart';
import '../pages/home.dart';
import 'auth.dart';
import 'dart:io';

class SignInButton extends StatefulWidget {
  @override
  _SignInButtonState createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {

  bool loggingIn = true;
  final loading = SnackBar(
    duration: Duration(days: 1),
      content: Row(
        children: [
          CircularProgressIndicator(),
          Text('    Logging In.....')
        ],
      )
  );

  @override
  void initState() {
    super.initState();
    currentUser().then((user){
      if(user!=null)
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (BuildContext context) => Home()));
    });
  }

  void signIn()async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Scaffold.of(context).showSnackBar(loading);
        signInWithGoogle().whenComplete(() {
          if (userEmail!=null){
            Scaffold.of(context).hideCurrentSnackBar();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (BuildContext context) => Home()));
          }
          else
            Scaffold.of(context).hideCurrentSnackBar();
        });
      }
    } on SocketException catch (_) {
      final snackBar = SnackBar(
          content: Text('No Internet Connection. TRY AGAIN!')
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      splashColor: Colors.grey,
      color: Colors.white,
      onPressed: (){
        signIn();
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: BorderSide(color: Colors.black38, width: 0.5)
      ),
      highlightElevation: 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/glogo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
