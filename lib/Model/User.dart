import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ApplicationUser{
  final String userId;
  final String email;

  ApplicationUser({this.userId, this.email});

  Map<String,dynamic> toMap(){
    return {
      'userId' : userId,
      'email' : email,
    };
  }

  ApplicationUser.fromFirestore(Map<String, dynamic> firestore)
      : userId = firestore['userId'],
        email = firestore['email'];

}