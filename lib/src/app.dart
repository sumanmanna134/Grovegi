import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grovegi/Blocs/auth_bloc_dart.dart';
import 'package:grovegi/Theme/AppTheme.dart';
import 'package:grovegi/routing/routes.dart';
import 'package:grovegi/src/screens/UnSupportedPlatform.dart';
import 'package:grovegi/src/screens/login/components/LoginController.dart';
import 'package:grovegi/src/screens/login/login.dart';
import 'package:provider/provider.dart';
final authBloc = Auth_Bloc();
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context)=> authBloc,)
      ],
        child: PlatformApp()
    );
  }
}

class PlatformApp extends StatefulWidget {
  @override
  _PlatformAppState createState() => _PlatformAppState();
}



class _PlatformAppState extends State<PlatformApp> {

  @override
  void dispose() {
    // TODO: implement dispose
    authBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    try{
      if(Platform.isIOS){
        return CupertinoApp(
          home: Login(),
          onGenerateRoute: Routes.generateCurpertinoRoute,
          debugShowCheckedModeBanner: false,
        );
      }else if(Platform.isAndroid){
        return MultiProvider(
          providers: [ChangeNotifierProvider(create: (context)=>LoginController())],
          child: GetMaterialApp(
            home: Login(),
            theme: AppTheme(),
            onGenerateRoute: Routes.generateRoute,
            debugShowCheckedModeBanner: false,
          ),
        );
      }
    } catch(e){
      return GetMaterialApp(
        home: UnSupportedPlatForm(),
        debugShowCheckedModeBanner: false,
      );
    }


  }
}



