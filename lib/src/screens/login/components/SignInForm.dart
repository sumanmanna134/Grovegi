import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grovegi/Blocs/auth_bloc_dart.dart';
import 'package:grovegi/Components/DefaultButton.dart';
import 'package:grovegi/Components/custom_suffix_icon.dart';
import 'package:grovegi/config/Size/SizeConfig.dart';
import 'package:grovegi/config/constant/AppColor.dart';
import 'package:grovegi/routing/routeconstant.dart';
import 'package:grovegi/src/screens/login/components/FormError.dart';
import 'package:grovegi/src/screens/login/components/LoginController.dart';
import 'package:provider/provider.dart';
class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  List<String> errors = [];
  TextEditingController smallText = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<Auth_Bloc>(context);
    print("Created");
    return Column(
      children: [
        buildEmailFormField(authBloc),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildPasswordFromField(authBloc),
        SizedBox(height: getProportionateScreenHeight(10)),
        SizedBox(height: getProportionateScreenHeight(20)),
        DefaultButton(
          text: "Continue",
          press: (){
          },
        )


      ],
    );
  }
 buildPasswordFromField(Auth_Bloc auth_bloc){
    return StreamBuilder<String>(
      stream: auth_bloc.password,
      builder: (context, snapshot) {
        return TextField(
          obscureText: true,
          onChanged: auth_bloc.changePassword,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            errorText: snapshot.error,
            errorStyle: TextStyle(color: Colors.red, fontSize: 12.0),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon:  "assets/icons/Lock.svg",),
          ),
        );
      }
    );
  }

  buildEmailFormField(Auth_Bloc auth_bloc) {
    return StreamBuilder<String>(
      stream: auth_bloc.email,
      builder: (context, snapshot) {
        print(snapshot.error.toString());
        return TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: auth_bloc.changeEmail,

          decoration: InputDecoration(
            labelText: "Email",
            hintText: "Enter your email",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            errorText: snapshot.error,
            suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg",)

        ),
        );
      }
    );
  }
}
