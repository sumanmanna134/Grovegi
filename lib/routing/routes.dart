import 'package:flutter/material.dart';
import 'package:grovegi/routing/routeconstant.dart';
import 'package:grovegi/src/screens/landing.dart';
import 'package:grovegi/src/screens/login.dart';
import 'package:grovegi/src/screens/signup.dart';

abstract class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){

      case RouteConstant.login:
        return _NoAnimationMaterialPageRoute<dynamic>(builder: (_) => Login(), name: RouteConstant.login);
        break;

      case RouteConstant.landing:
        return _NoAnimationMaterialPageRoute<dynamic>(builder: (_) => Landing(), name: RouteConstant.landing);
        break;

      case RouteConstant.signup:
        return _NoAnimationMaterialPageRoute(builder: (_) => Signup(), name: RouteConstant.signup);





    }

  }
}

class _NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T>{
  _NoAnimationMaterialPageRoute({
    @required WidgetBuilder builder ,
    @required String name,
    bool maintainState=true,
    bool fullScreenDialog=false
  }):super(builder: builder, maintainState: maintainState , settings: RouteSettings(name: name), fullscreenDialog: fullScreenDialog);

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) => child;

}