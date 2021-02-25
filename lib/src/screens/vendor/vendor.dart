import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grovegi/Blocs/auth_bloc_dart.dart';
import 'package:grovegi/config/constant/AppColor.dart';
import 'package:grovegi/config/constant/TabBarStyle_dart.dart';
import 'package:grovegi/config/constant/appColorConstant.dart';
import 'package:grovegi/routing/routeconstant.dart';
import 'package:grovegi/widget/Orders.dart';
import 'package:grovegi/widget/Products.dart';
import 'package:grovegi/widget/Profile.dart';
import 'package:grovegi/widget/VendorScaffold.dart';
import 'package:grovegi/widget/navbar.dart';
import 'package:provider/provider.dart';
class Vendor extends StatefulWidget {
  StreamSubscription _userSubcription;
  @override
  _VendorState createState() => _VendorState();

  static TabBar get vendorTabBar {
    return TabBar(
      unselectedLabelColor: TabBarStyles.unselectedLabelColor,
      indicatorColor: TabBarStyles.indicatorColor,
      labelColor: AppColors.straw,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 3.0,
            color: AppColors.straw
          )
        )
      ),


      tabs: <Widget>[
        Tab(icon:Icon(Icons.list),),
        Tab(icon:Icon(Icons.add_alert_rounded),),
        Tab(icon:Icon(Icons.person),)
      ],
    );
  }
}

class _VendorState extends State<Vendor> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, (){
      var authBloc = Provider.of<Auth_Bloc>(context, listen: false);
      widget._userSubcription = authBloc.user.listen((user) {
        if(user ==null) Get.offNamedUntil(RouteConstant.login, (route) => false);
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    widget._userSubcription.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return CupertinoPageScaffold(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context , bool innerBoxScrolled){
            return <Widget>[
              AppNavBar.cupertinoSilverNavigationBar(title: 'Vendor Name' , context: context),
            ];
          },
          body: VendorScaffold.cupertinoTabScaffold,
        ),
      );

    }else {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context ,bool innerBoxScrolled){
              return <Widget>[
                AppNavBar.silverAppBar(title: "Grovegi", tabBar: Vendor.vendorTabBar, context:context)

              ];
          },
            body: TabBarView(children: <Widget>[
              Products(),
              Orders(),
              Profile()
            ],),
          ),
        ),
      );

    }
  }
}
