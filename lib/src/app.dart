import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grovegi/routing/routes.dart';
import 'package:grovegi/src/screens/login.dart';
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Login(),
      onGenerateRoute: Routes.generateRoute,



    );
  }
}
