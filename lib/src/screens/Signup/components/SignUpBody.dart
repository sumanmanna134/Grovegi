import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grovegi/Components/NoAccountText.dart';
import 'package:grovegi/Components/socialcard.dart';
import 'package:grovegi/config/Size/SizeConfig.dart';
import 'package:grovegi/config/constant/AppString.dart';
import 'package:grovegi/routing/routeconstant.dart';
import 'package:grovegi/src/screens/Signup/components/SignUpForm.dart';
import 'package:grovegi/src/screens/login/components/SignInForm.dart';
class SignUpBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04,),
                Text(AppString.RegisterTitle, style: TextStyle(color:  Colors.black, fontSize: getProportionateScreenWidth(28), fontWeight: FontWeight.bold),),
                Text(AppString.RegisterSubtitle, textAlign: TextAlign.center,),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: "assets/icons/google-icon.svg",
                      press: (){},
                    ),

                    SocialCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: (){},
                    ),
                    SocialCard(
                      icon: "assets/icons/twitter.svg",
                      press: (){},
                    )
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
                NoAccountText(title: "Already Have an Account?",onPressed: (){
                  Get.offAllNamed(RouteConstant.login);
                },subtitle: "Sign In",)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
