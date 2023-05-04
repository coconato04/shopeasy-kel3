import 'dart:math';

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

  //DATABASE OPERATIONS
  //CREATE DOCUMENTS IN FIRESTORE
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

  //check if user is in the database
  Future userIsInDatabase({required String email}) async {
    try {
      //check if email already exists
      final emailDuplicate = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      //return false if username or email already exists
      if (emailDuplicate.docs.isNotEmpty) {
        print('user is in database');
        return true;
      } else {
        print('user is not in database');
        return false;
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
        'coupons': [],
        'purchaseHistory': [],
        'shoppingCart': [],
        'favoritesList': [],
        'isSeller': false,
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
  createUsernameFromEmail() {
    //use email to create username
    final user = FirebaseAuth.instance.currentUser!;
    final email = user.email!;
    final username = email.substring(0, email.indexOf('@'));
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
        'username': createUsernameFromEmail(),
        'email': email,
        'easypayBalance': 0,
        'photoUrl': '',
        'createdAt': DateTime.now().millisecondsSinceEpoch,
        'coupons': [],
        'purchaseHistory': [],
        'shoppingCart': [],
        'favoritesList': [],
        'isSeller': false,
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

  //create seller document from user document
  Future createSellerAccount(
      {required String userID,
      required String sellerName,
      required String sellerDesc}) async {
    try {
      //create user document in firestore
      final docSeller = await FirebaseFirestore.instance
          .collection('sellers')
          .doc(userID)
          .get();

      final json = {
        'shopID': userID,
        'shopName': sellerName,
        'shopBio': sellerDesc,
        'shopProductsID': [],
        'photoUrl': '',
      };

      //create seller document in firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .set(json);

      print('create user firestore success');
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // create product
  Future createProduct(User user, String productName, String productDesc,
      int productPrice, String productCategory, int productInventory) async {
    try {
      // create product document in firestore
      final docProduct =
          FirebaseFirestore.instance.collection('products').doc();
      // create product json
      final json = {
        'productID': docProduct.id,
        'sellerID': user.uid,
        'productName': productName,
        'productInfo': productDesc,
        'productPrice': productPrice,
        'productCategory': productCategory,
        'photoUrl': [],
        'productRating': [],
        'productReviews': [],
        'productInventory': productInventory,
      };

      await FirebaseFirestore.instance
          .collection('products')
          .doc(docProduct.id)
          .set(json);

      print('create product success');
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //UPDATE AND GET DATA FROM FIRESTORE
  //get data from firestore
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

  // get data from firestore using firebase user as input
  Future getData(User user, String collection) async {
    try {
      final docUser = await FirebaseFirestore.instance
          .collection(collection)
          .doc(user.uid)
          .get();
      print(user.uid);
      return docUser.data();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //update user data in firestore
  Future updateData(User user, String collection, String field, value) async {
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

  Future isSeller(User user) async {
    try {
      final docUser = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      return docUser.data()!['isSeller'];
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
