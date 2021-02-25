import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grovegi/config/Size/SizeConfig.dart';
import 'package:grovegi/config/constant/AppColor.dart';
class UnSupportedPlatForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Text("", style: Theme.of(context).textTheme.headline2, ),
      ),
    );
  }
}
