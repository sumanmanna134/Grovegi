import 'package:flutter/material.dart';
import 'package:grovegi/config/Size/SizeConfig.dart';
import 'package:grovegi/config/constant/AppColor.dart';
class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press, this.backgroundColor, this.textColor,
  }) : super(key: key);
  final String text;
  final Function press;

  final Color backgroundColor;
  final Color textColor;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20) ),
        disabledColor: Colors.grey,
        disabledTextColor: Colors.white,
        color: backgroundColor!=null?backgroundColor:kPrimaryColor,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: textColor!=null?textColor:Colors.white,
          ),
        ),
      ),
    );
  }
}