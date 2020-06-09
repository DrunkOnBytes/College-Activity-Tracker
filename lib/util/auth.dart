import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String userName;
String userEmail;
String userImageUrl;
String uid;

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);

  userName = user.displayName;
  userEmail = user.email;
  userImageUrl = user.photoUrl;
  uid = user.uid;
// Only taking the first part of the name, i.e., First Name
  if (userName.contains(" ")) {
    userName = userName.substring(0, userName.indexOf(" "));
  }

  if (user != null) {
    // Check is already sign up
    final QuerySnapshot result =  await Firestore.instance.collection('users').where('id', isEqualTo: user.uid).getDocuments();
    final List < DocumentSnapshot > documents = result.documents;
    if (documents.length == 0) {
      // Update data to server if new user
      Firestore.instance.collection('users').document(user.uid).setData(
          { 'username': userName, 'photoUrl': userImageUrl, 'id': user.uid });
    }
  }

  print('Signed in with Google: $userEmail');
  return user.uid;
}

void signOut() async{
  await _auth.signOut();
  await googleSignIn.signOut();
  userEmail=null;
  userName=null;
  userImageUrl=null;
  print("User Sign Out");
}

Future<String> currentUser() async {
  return (await _auth.currentUser()).uid;
}