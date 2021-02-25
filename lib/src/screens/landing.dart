import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grovegi/Blocs/auth_bloc_dart.dart';
import 'package:grovegi/Components/DefaultButton.dart';
import 'package:grovegi/routing/routeconstant.dart';
import 'package:grovegi/src/app.dart';
import 'package:provider/provider.dart';
class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return CupertinoPageScaffold(
        child: pageBody(context),
      );
    }else {
      return Scaffold(body: pageBody(context),);

    }

  }

  Widget pageBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DefaultButton(
          press: (){
            Get.offAllNamed(RouteConstant.vendor);
          },
          text: "Go to Vendor",
        )
      ],
    );

  }
}
