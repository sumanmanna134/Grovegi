import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grovegi/config/Size/SizeConfig.dart';
class CustomSuffixIcon extends StatelessWidget {
  final String svgIcon;

  const CustomSuffixIcon({Key key, this.svgIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0,
          getProportionateScreenWidth(20),
          getProportionateScreenWidth(20),
          getProportionateScreenWidth(20)),
      child: SvgPicture.asset(svgIcon, height: getProportionateScreenHeight(18),),
    );
  }
}
