import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grovegi/config/Size/SizeConfig.dart';
import 'package:grovegi/src/screens/login/components/LoginBody.dart';
class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if(Platform.isIOS){
      return CupertinoPageScaffold(

      );
    }else if(Platform.isAndroid){
      return Scaffold(
        body: LoginBody(),
      );


    }
  }
}
