import 'package:flutter/material.dart';
import 'package:grovegi/Components/DefaultButton.dart';
import 'package:grovegi/Components/custom_suffix_icon.dart';
import 'package:grovegi/config/Size/SizeConfig.dart';
import 'package:grovegi/config/constant/AppColor.dart';
import 'package:grovegi/src/screens/login/components/FormError.dart';
import 'package:grovegi/src/screens/login/components/LoginController.dart';
import 'package:provider/provider.dart';
class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}



class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Consumer<LoginController>(
        builder: (context, controller, widget){
          return Column(
            children: [
              buildEmailFormField(controller),
              SizedBox(height: getProportionateScreenHeight(10)),
              FormError(errors: controller.getError,),
              SizedBox(height: getProportionateScreenHeight(20)),
              DefaultButton(
                text: "Continue",
                press: (){
                  if(_formKey.currentState.validate()){
                    _formKey.currentState.save();
                  }
                },
              )


            ],
          );
        },

      ),
    );
  }

  TextFormField buildEmailFormField(final loginController) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newVal)=> email=newVal,
      onChanged: (value){
        if(value.isNotEmpty){
          if(emailValidatorRegExp.hasMatch(value)){
            loginController.removeError(error:kInvalidEmailError );
          }
          loginController.removeError(error:kEmailNullError);

        }

        return null;
      },
      validator: (value){
        if(value.isEmpty){
          loginController.addError(error:kEmailNullError);
          return "";
        }else if(!emailValidatorRegExp.hasMatch(value)){
          loginController.addError(error:kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg",)

      ),
    );
  }
}
