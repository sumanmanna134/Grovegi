import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grovegi/config/Size/SizeConfig.dart';
class FormError extends StatelessWidget {
  final List<String> errors;

  const FormError({Key key, this.errors}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(errors.length, (index) =>formErrorText(error: errors[index]) )
    );
  }
  
  Row formErrorText({String error}){
    return Row(
      children: [
        SvgPicture.asset("assets/icons/Error.svg",
          height: getProportionateScreenHeight(14),
          width: getProportionateScreenWidth(14),),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(error)
      ],
    );
  }
}
