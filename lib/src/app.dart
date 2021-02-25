import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grovegi/Blocs/auth_bloc_dart.dart';
import 'package:grovegi/Theme/AppTheme.dart';
import 'package:grovegi/config/Size/SizeConfig.dart';
import 'package:grovegi/config/constant/AppColor.dart';
import 'package:grovegi/config/constant/appColorConstant.dart';
import 'package:grovegi/routing/routes.dart';
import 'package:grovegi/src/screens/Start.dart';
import 'package:grovegi/src/screens/UnSupportedPlatform.dart';
import 'package:grovegi/src/screens/landing.dart';
import 'package:grovegi/src/screens/login/components/LoginController.dart';
import 'package:grovegi/src/screens/login/login.dart';
import 'package:grovegi/src/screens/vendor/vendor.dart';
import 'package:provider/provider.dart';
final authBloc = Auth_Bloc();
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context)=> authBloc,),
        FutureProvider(create: (context)=> authBloc.isLoggedIn())
      ],
        child: PlatformApp()
    );
  }
}

class PlatformApp extends StatefulWidget {
  @override
  _PlatformAppState createState() => _PlatformAppState();
}



class _PlatformAppState extends State<PlatformApp> with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void dispose() {
    // TODO: implement dispose
    authBloc.dispose();
    _animationController.dispose();
    super.dispose();
  }
  
  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(duration: new Duration(seconds: 2), vsync: this);
    _animationController.repeat();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final isLogedIn = Provider.of<bool>(context);
    print(isLogedIn);
    try{
      if(Platform.isIOS){
        return CupertinoApp(
          home: (isLogedIn == null)?activityIndicator(true):(isLogedIn==true)?Landing() : Login(),
          onGenerateRoute: Routes.generateCurpertinoRoute,
          debugShowCheckedModeBanner: false,
          theme: CupertinoThemeData(
            primaryColor: AppColors.straw,
            scaffoldBackgroundColor: Colors.white
          ),
        );
      }else if(Platform.isAndroid){
        return GetMaterialApp(
          home: (isLogedIn == null)?activityIndicator(false):(isLogedIn==true)?Landing(): Start(),
          theme: AppTheme(),
          onGenerateRoute: Routes.generateRoute,
          debugShowCheckedModeBanner: false,
        );
      }
    } catch(e){
      return GetMaterialApp(
        home: UnSupportedPlatForm(),
        debugShowCheckedModeBanner: false,
      );
    }


  }

  Widget activityIndicator(bool isIOS){
    return (isIOS)? CupertinoPageScaffold(child: Center(child: CupertinoActivityIndicator(),),)
        : Scaffold(
        backgroundColor: Colors.red[700],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("GroVegi", style: TextStyle(fontSize: getProportionateScreenWidth(64), fontWeight: FontWeight.w800, color: Colors.white),),
              SizedBox(height: getProportionateScreenHeight(20)),
              Center(child: CircularProgressIndicator(valueColor:_animationController.drive(ColorTween(begin:Colors.white, end : Colors.yellow)),))
            ],
          )
        )
    );


  }
}



