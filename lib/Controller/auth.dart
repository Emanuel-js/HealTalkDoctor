import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../index.dart';

class AuthControlle {
  final _auth = FirebaseAuth.instance;
  Future regsiter<bool>(String fullName, String email, String password,
      BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // FirebaseApi().addPatient(_auth.currentUser.uid, firstName, lastName,
      //     email, gender, false, null, age);

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        DisplayMsg().displayMessage(
            msg: 'The password provided is too weak.', context: context);
        return false;
      } else if (e.code == 'email-already-in-use') {
        DisplayMsg().displayMessage(
            msg: 'The account already exists for that email.',
            context: context);
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  // void emailVar(BuildContext context) async {
  //   User u = FirebaseAuth.instance.currentUser;

  //   if (u.emailVerified) {
  //     Navigator.pushReplacement(context, createRoute(HomeScreen1()));
  //   }
  // }

  // Future login<bool>(
  //   String email,
  //   String password,
  //   BuildContext context,
  // ) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //     return true;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       DisplayMsg().displayMessage(
  //           msg: 'No user found for that email.', context: context);
  //       return false;
  //     } else if (e.code == 'wrong-password') {
  //       DisplayMsg().displayMessage(
  //           msg: 'Wrong password provided for that user.', context: context);
  //       return false;
  //     }
  //   }
  // }

  Future logout<User>() async {
    _auth.signOut();
    print("user is loged out");
  }

  // bool changePassword(String currentPassword, String newPassword, context) {
  //   final user = FirebaseAuth.instance.currentUser;
  //   bool cange = false;
  //   final cred = EmailAuthProvider.credential(
  //       email: user.email, password: currentPassword);

  //   user.reauthenticateWithCredential(cred).then((value) {
  //     user.updatePassword(newPassword).then((_) {
  //       DisplayMsg().displayMessage(
  //           msg: "password is successfully change!", context: context);

  //       return cange = true;
  //     }).catchError((error) {
  //       DisplayMsg().displayMessage(
  //           msg: "password is not changed please try again!", context: context);

  //       return cange = false;
  //     });
  //   }).catchError((err) {
  //     DisplayMsg().displayMessage(
  //         msg: "your current password is not correct!", context: context);
  //     return cange = false;
  //   });
  //   return cange;
  // }

}
