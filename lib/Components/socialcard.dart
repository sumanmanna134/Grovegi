import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grovegi/config/Size/SizeConfig.dart';
class SocialCard extends StatelessWidget {
  final String icon;
  final Function press;

  const SocialCard({Key key, this.icon, this.press}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(getProportionateScreenHeight(12)),
        height: getProportionateScreenHeight(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
