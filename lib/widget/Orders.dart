import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return CupertinoPageScaffold(child: pageBody(),);
    }else{
      return Scaffold(body: pageBody(),);
    }
  }
  Widget pageBody(){
    return Center(child: Text("orders"),);
  }
}
