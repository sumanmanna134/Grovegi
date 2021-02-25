import 'package:flutter/cupertino.dart';
import 'package:grovegi/config/constant/appColorConstant.dart';
import 'package:grovegi/widget/Orders.dart';
import 'package:grovegi/widget/Products.dart';
import 'package:grovegi/widget/Profile.dart';

abstract class VendorScaffold{
  static CupertinoTabScaffold get cupertinoTabScaffold{
    return CupertinoTabScaffold(
      tabBar: _cupertinoTabbar,
      tabBuilder: (context, index){
        return _pageSelection(index);


      },
    );


  }
  static get _cupertinoTabbar{
    return CupertinoTabBar(
      backgroundColor: AppColors.darkblue,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.create) , title: Text("Products")),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.bell) , title: Text("Orders")),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.person) , title: Text("Profile")),
      ],
    );
  }
  static Widget _pageSelection(int index){
    if(index == 0){
      return Products();
    }
    if(index == 1){
      return Orders();

    }
    return Profile();
  }
}