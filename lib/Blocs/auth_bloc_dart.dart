import 'dart:async';

import 'package:rxdart/rxdart.dart';

final RegExp regExpEmail = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
final RegExp regExpPassword = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

class Auth_Bloc{
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _errorMessage = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get isValid => CombineLatestStream.combine2(email, password, (email, password) => true);
  Stream<String> get errorMessage => _errorMessage.stream;

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  dispose(){
    _email.close();
    _password.close();
    _errorMessage.close();
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



}