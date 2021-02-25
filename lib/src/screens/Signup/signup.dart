import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grovegi/Blocs/auth_bloc_dart.dart';
import 'package:grovegi/routing/routeconstant.dart';
import 'package:grovegi/src/screens/Signup/components/SignUpBody.dart';
import 'package:grovegi/widget/alert.dart';
import 'package:provider/provider.dart';
class Signup extends StatefulWidget {
  StreamSubscription _errorMessageSubscription;
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {


  @override
  void initState() {
    // TODO: implement initState
    final authBloc = Provider.of<Auth_Bloc>(context, listen: false);
    authBloc.user.listen((user) {
      if(user!=null) Get.offAllNamed(RouteConstant.landing);
    });
    widget._errorMessageSubscription = authBloc.errorMessage.listen((error) {
      if(error != ''){
        AppAlert.showErrorDialog(Platform.isIOS, context, error).then((_) =>authBloc.clearErrorMessage());
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpBody(),
    );
  }
}
