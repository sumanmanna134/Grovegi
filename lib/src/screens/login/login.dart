import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grovegi/Blocs/auth_bloc_dart.dart';
import 'package:grovegi/config/Size/SizeConfig.dart';
import 'package:grovegi/routing/routeconstant.dart';
import 'package:grovegi/src/screens/login/components/LoginBody.dart';
import 'package:provider/provider.dart';
class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  @override
  void initState() {
    // TODO: implement initState
    final authBloc = Provider.of<Auth_Bloc>(context, listen: false);
    authBloc.user.listen((user) {
      if(user!=null) Get.offAllNamed(RouteConstant.landing);
    });
    super.initState();
  }
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
