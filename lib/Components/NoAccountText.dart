import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grovegi/config/Size/SizeConfig.dart';
import 'package:grovegi/config/constant/AppColor.dart';
import 'package:grovegi/routing/routeconstant.dart';
class NoAccountText extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onPressed;

  const NoAccountText({Key key, this.title, this.onPressed, this.subtitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(fontSize: getProportionateScreenWidth(16)),),
        InkWell(
            onTap: onPressed,
            child: Text(subtitle, style: TextStyle(fontSize: getProportionateScreenWidth(16), color: kPrimaryColor),))
      ],
    );
  }
}
