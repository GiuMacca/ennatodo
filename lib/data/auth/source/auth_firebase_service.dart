import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ennatodo/data/auth/models/user_creation_req.dart';
import 'package:ennatodo/data/auth/models/user_signin_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(UserSigninReq user);
  Future<Either> sendPasswordResetEmail(String email);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signup(UserCreationReq user) async {
    try {
      var returnedData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email!,
            password: user.password!,
          );

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(returnedData.user!.uid)
          .set({
            'firstName': user.firstName,
            'lastName': user.lastName,
            'email': user.email,
          });

      return const Right('Sign up success');
    } on FirebaseAuthException catch (e) {
      // password debole
      // email in uso
      String message = '';

      if (e.code == 'weak-password') {
        message = "The password is too weak";
      } else if (e.code == 'email-already-in-use') {
        message = "An account already exists with that email";
      } else {
        message = e.message ?? "Unknown error.";
      }

      return Left(message);
    } /*catch (e) {
      // Cattura qualsiasi altro errore (es. i permessi di Firestore)
      return Left("Database error: Missing or insufficient permissions.");
    }*/
  }

  @override
  Future<Either<dynamic, dynamic>> signin(UserSigninReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      return const Right('Sign in success');
    } on FirebaseAuthException catch (e) {
      // password debole
      // email in uso
      String message = '';

      if (e.code == 'invalid-email') {
        message = "Not user found for that email";
      } else if (e.code == 'invalid-credential') {
        message = "Wrong credential";
      } else {
        message = e.message ?? "Unknown error.";
      }

      return Left(message);
    }
  }

  @override
  Future<Either<dynamic, dynamic>> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const  Right("Password reset email is sent");
    } catch (e) {
       return const  Left("Please try again");
    }
  }
}
