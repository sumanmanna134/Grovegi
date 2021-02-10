import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier{
  bool isChecked=false;
  List<String> errorList=[];


  addError({String error, List<String> errors}){
    if(!this.errorList.contains(error)){
      print("add");
      this.errorList.add(error);
      notifyListeners();
    }
  }

  removeError({String error, List<String> errors}){
    if(this.errorList.contains(error)){
      print("remove");
      this.errorList.remove(error);
      notifyListeners();
    }
  }

  List<String> get getError{
    return this.errorList;
  }

  set isRemember(bool checked){
    this.isChecked = checked;
    notifyListeners();
  }

  bool get isRemember{
    return isChecked;
  }



}