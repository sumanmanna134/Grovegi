import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grovegi/Components/DefaultButton.dart';
import 'package:grovegi/Components/socialcard.dart';
import 'package:grovegi/config/Size/SizeConfig.dart';
import 'package:grovegi/config/constant/AppColor.dart';
import 'package:grovegi/routing/routeconstant.dart';
class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[700],
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("°GroVegi", style: TextStyle(fontSize: getProportionateScreenWidth(64), fontWeight: FontWeight.w800, color: Colors.white),),
                SizedBox(height: getProportionateScreenHeight(100)),
                Text("Let's Get Started",style: TextStyle(fontSize: getProportionateScreenWidth(24), fontWeight: FontWeight.w800, color: Colors.white) ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: DefaultButton(text: "Login",press: (){
                    Get.toNamed(RouteConstant.login);

                  },
                      backgroundColor: Colors.white,
                      textColor: kPrimaryColor
                  ,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: DefaultButton(text: "Register New Account",press: ()=> Get.toNamed(RouteConstant.signup),
                      backgroundColor: kPrimaryLightColor,
                      textColor: kPrimaryColor
                  ,),
                ),
              ],
            )
        )
    );
  }
}
