import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:grovegi/Model/User.dart';
import 'package:grovegi/Service/firestoreService.dart';
import 'package:rxdart/rxdart.dart';

final RegExp regExpEmail = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
final RegExp regExpPassword = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

class Auth_Bloc{
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmPassword = BehaviorSubject<String>();
  final _errorMessage = BehaviorSubject<String>();
  final _user = BehaviorSubject<ApplicationUser>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get isValid => CombineLatestStream.combine2(email, password,(email, password, ) => true);
  Stream<String> get errorMessage => _errorMessage.stream;
  Stream<bool> get isSignUpValid => CombineLatestStream.combine3(email,password,confirmPassword, (email, password, confirmPassword) => (0 == password.compareTo(confirmPassword)));
  Stream<String> get confirmPassword => _confirmPassword.stream.transform(validatePassword).doOnData((String c) {
    if(0 != _password.value.compareTo(c)){
      _confirmPassword.addError("No Match");
    }
  });

  Stream<ApplicationUser> get user => _user.stream;
  String get userId => _user.value.userId;

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeConfrmPassword => _confirmPassword.sink.add;


  dispose(){
    _email.close();
    _password.close();
    _confirmPassword.close();
    _errorMessage.close();
    _user.close();
  }

  //Transformer

  final validateEmail = StreamTransformer<String,String>.fromHandlers(handleData: (email,sink){
    if(regExpEmail.hasMatch(email.trim())){
      sink.add(email.trim());
    }else{
      sink.addError("Must be Valid Email Address");
    }
  });

  final validatePassword = StreamTransformer<String,String>.fromHandlers(handleData: (password,sink){
    if(password.length >=8){
      sink.add(password.trim());
    }else{
      sink.addError('8 Character Minimum');
    }
  });

  //function

  signupEmail() async{
    try{
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(email: _email.value.trim(), password: _password.value.trim());
      var user = ApplicationUser(email: _authResult.user.email, userId: _authResult.user.uid);
      await _firestoreService.addUser(user);
      _user.sink.add(user);
    }catch(error){
      print(error);
      _errorMessage.sink.add(error.message);
    }

  }

  loginEmail() async{
    try{
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(email: _email.value.trim(), password: _password.value.trim());
      var user = ApplicationUser(email: _authResult.user.email, userId: _authResult.user.uid);
      await _firestoreService.fetchUser(_authResult.user.uid);
      _user.sink.add(user);
    }catch(error){
      print(error);
      _errorMessage.sink.add(error.message);
    }

  }

  Future<bool> isLoggedIn() async{
    var firesbaseUser = await _auth.currentUser;
    if(firesbaseUser == null) return false;
    var user = await _firestoreService.fetchUser(firesbaseUser.uid);
    if(user == null) return false;
    _user.sink.add(user);
    return true;

  }

  logout() async {
    await _auth.signOut();
    _user.sink.add(null);
  }

  clearErrorMessage(){
    _errorMessage.sink.add('');
  }







}