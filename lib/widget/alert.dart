import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grovegi/config/Size/SizeConfig.dart';
import 'package:grovegi/config/constant/AppColor.dart';
import 'package:grovegi/config/constant/appColorConstant.dart';

abstract class AppAlert{
  static Future<void> showErrorDialog(bool isIos, BuildContext context, String errorMessage) async {
    return (isIos)?
        showCupertinoDialog(
          context: context,
          barrierDismissible: false,
          builder: (context){
            return CupertinoAlertDialog(

              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text(errorMessage, style: TextStyle(fontSize: getProportionateScreenWidth(16), color: kPrimaryColor ),)
                  ],
                ),
              ),
              actions: [
                CupertinoButton(
                  child: Text('Okay',),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                )
              ],
            );
          }
        ):
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
          backgroundColor:Colors.white,
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(errorMessage, style: TextStyle(fontSize: getProportionateScreenWidth(16), color: kPrimaryColor ),)
              ],
            ),
          ),
          actions: [
            FlatButton(
              child: Text('Okay',),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],

        );
    }
    );
  }
}