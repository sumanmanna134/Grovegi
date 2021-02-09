import 'package:flutter/material.dart';
import 'package:grovegi/config/Size/SizeConfig.dart';
import 'package:grovegi/src/screens/ForgotPassword/components/ForgotPasswordForm.dart';
class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = '/forgot_password';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 20),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                  ),
                  Text("Forgot Password", style: TextStyle(fontSize: getProportionateScreenWidth(28), color: Colors.black , fontWeight: FontWeight.bold),),
                  Text("Please enter your email and we will send \nyou a link to return to your account" , textAlign: TextAlign.center,),
                  SizedBox(height: SizeConfig.screenHeight * 0.1,),
                  ForgotPasswordForm()

                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
