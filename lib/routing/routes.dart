import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grovegi/routing/routeconstant.dart';
import 'package:grovegi/src/screens/ForgotPassword/forgot_password_screen.dart';
import 'package:grovegi/src/screens/Signup/signup.dart';
import 'package:grovegi/src/screens/landing.dart';
import 'package:grovegi/src/screens/login/login.dart';
import 'package:grovegi/src/screens/vendor/vendor.dart';


abstract class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){

      case RouteConstant.login:
        return _NoAnimationMaterialPageRoute<dynamic>(builder: (_) => Login(), name: RouteConstant.login, fullScreenDialog: true);

      case RouteConstant.landing:
        return _NoAnimationMaterialPageRoute<dynamic>(builder: (_) => Landing(), name: RouteConstant.landing);

      case RouteConstant.signup:
        return _NoAnimationMaterialPageRoute(builder: (_) => Signup(), name: RouteConstant.signup);

      case RouteConstant.forgotPassword:
        return _NoAnimationMaterialPageRoute(builder: (_) => ForgotPasswordScreen(), name: RouteConstant.forgotPassword);

      case RouteConstant.vendor:
        return _NoAnimationMaterialPageRoute(builder: (_) => Vendor(), name: RouteConstant.vendor);

      default:
        return _NoAnimationMaterialPageRoute<dynamic>(builder: (_) => Login(), name: RouteConstant.login);









    }

  }

  static Route<dynamic> generateCurpertinoRoute(RouteSettings settings){
    switch(settings.name){

      case RouteConstant.login:
        return _NoAnimationCupertinoPageRoute<dynamic>(builder: (_) => Login(), name: RouteConstant.login);


      case RouteConstant.landing:
        return _NoAnimationCupertinoPageRoute<dynamic>(builder: (_) => Landing(), name: RouteConstant.landing);


      case RouteConstant.signup:
        return _NoAnimationCupertinoPageRoute(builder: (_) => Signup(), name: RouteConstant.signup);

      default:
        return _NoAnimationCupertinoPageRoute<dynamic>(builder: (_) => Login(), name: RouteConstant.login);





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


class _NoAnimationCupertinoPageRoute<T> extends CupertinoPageRoute<T>{
  _NoAnimationCupertinoPageRoute({
    @required WidgetBuilder builder,
    @required String name,
    bool maintainState=true,
    bool fullScreenDialog=false
}): super(builder: builder, maintainState: maintainState, fullscreenDialog: fullScreenDialog, settings: RouteSettings(name: name));

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // TODO: implement buildTransitions
    return super.buildTransitions(context, animation, secondaryAnimation, child);
  }
}