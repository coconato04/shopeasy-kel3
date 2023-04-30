import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //check whether user is logged in or not and returns true or false
  Future<bool> isLoggedIn() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  //register with email and password using email verification
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      //send email verification
      await user!.sendEmailVerification();
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //reset password
  Future resetPassword(String email) async {
    try {
      return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in personal email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      //email verification check
      if (user!.emailVerified) {
        return user;
      } else {
        print('Email not verified');
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with google
  Future<User?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Authenticate with Firebase using the credential
      final UserCredential result =
          await _auth.signInWithCredential(credential);
      final User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      _googleSignIn.signOut();
      return await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //resend email verification
  Future resendEmailVerification() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //forgot password
  Future forgotPassword(String email) async {
    try {
      print('firebase forgot password $email');
      return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //create user check
  Future userAndEmailIsDuplicate(
      {required String username, required String email}) async {
    try {
      //check if username already exists
      final usernameDuplicate = await FirebaseFirestore.instance
          .collection('users')
          .where('username', isEqualTo: username)
          .get();

      //check if email already exists
      final emailDuplicate = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      //return false if username or email already exists
      if (usernameDuplicate.docs.isNotEmpty || emailDuplicate.docs.isNotEmpty) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //create user firestore
  Future createUserWithEmail(
      {required String username, required String email}) async {
    try {
      //get firebase auth user id
      final user = FirebaseAuth.instance.currentUser!;
      //create user document in firestore
      final docUser = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      final json = {
        'userID': docUser.id,
        'username': username,
        'email': email,
        'easypayBalance': 0,
        'photoUrl': '',
        'createdAt': DateTime.now().millisecondsSinceEpoch,
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(docUser.id)
          .set(json);

      print('create user firestore success');
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //create random username
  createRandomUsername() {
    String temp = 'user${DateTime.now().millisecondsSinceEpoch}';
    //return only 15 characters
    final String username = temp.substring(0, 15);
    return username;
  }

  //create user firestore with google sign in
  Future createUserWithGoogle({required String email}) async {
    try {
      //create user document in firestore
      final docUser =
          await FirebaseFirestore.instance.collection('users').doc().get();

      final json = {
        'userID': docUser.id,
        'username': createRandomUsername(),
        'email': email,
        'easypayBalance': 0,
        'photoUrl': '',
        'createdAt': DateTime.now().millisecondsSinceEpoch,
        'updatedAt': DateTime.now().millisecondsSinceEpoch,
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(docUser.id)
          .set(json);

      print('create user firestore success');
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //get data from firestore using firebase auth user as input and return user data in json format or null if error occurs
  Future getUserData(User user) async {
    try {
      final docUser = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      return docUser.data();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //update user data in firestore
  Future updateUserData(
      {required User user,
      required String collection,
      required String field,
      required String value}) async {
    try {
      final docUser = await FirebaseFirestore.instance
          .collection(collection)
          .doc(user.uid)
          .update({field: value});
      return docUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
