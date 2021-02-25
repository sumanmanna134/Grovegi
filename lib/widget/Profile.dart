import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grovegi/Blocs/auth_bloc_dart.dart';
import 'package:provider/provider.dart';
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return CupertinoPageScaffold(child: pageBody(context),);
    }else{
      return Scaffold(body: pageBody(context),);
    }
  }
  Widget pageBody(BuildContext context){
    final authBloc = Provider.of<Auth_Bloc>(context);

    return Center(child: FlatButton(child: Text("Logout"), onPressed: ()=> authBloc.logout(),),);
  }
}
