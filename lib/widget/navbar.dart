import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:grovegi/config/constant/appColorConstant.dart';
import 'package:grovegi/widget/DataSearchWidget.dart';
abstract class AppNavBar{
  static CupertinoSliverNavigationBar cupertinoSilverNavigationBar({String title, BuildContext context}){
    return CupertinoSliverNavigationBar(
      largeTitle: Text(title),
      backgroundColor: Colors.transparent,
      border: null,
    );
  }

  static SliverAppBar silverAppBar({@required String title,@required TabBar tabBar, bool floating=true, bool pinned=true, Color textColor, double fontSize=16.0, Widget background, @required BuildContext context}){
    return SliverAppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 22),
        child: Text(title, style: TextStyle(color: Colors.white70, fontSize: 22, fontFamily: 'Muli'),),
      ),
      backgroundColor: AppColors.darkblue,
      bottom: tabBar,
      floating: floating,
      pinned: pinned,
      snap: true,

      actions: [
        IconButton(icon: Icon(Icons.search),onPressed: (){
          showSearch(context: context, delegate: DataSearch());
        },)
      ],




    );

  }


}