import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grovegi/config/Size/SizeConfig.dart';

import 'DataSearchWidget.dart';
class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return CupertinoPageScaffold(child: pageBody(),);
    }else{
      return Scaffold(body: pageBody(),);
    }
  }
  Widget pageBody(){
    final suggestionList = DataSearch().datas;
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index)=> Card(
        margin: EdgeInsets.only(left: 15,right: 15, top: 6,bottom: 3),
        elevation: 1,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
              height: 170.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: getProportionateScreenWidth(100),
                          child: Text(suggestionList[index].title, style: TextStyle(fontSize: 18.0,
                            fontWeight: FontWeight.w600,), overflow: TextOverflow.ellipsis, maxLines: 2,),

                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Container(
                                color : Colors.amber[800],
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10),
                                  child: Text(suggestionList[index].type,style: TextStyle(color: Colors.white),),
                                )),


                          ],
                        ),

                      ],
                    ),
                    Text(suggestionList[index].description, style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 10.0,),

                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2.0),
                          width: 50.0,
                          alignment: Alignment.center,
                          child: Text(" ${index} / ${suggestionList.length}", ),
                        ),
                        SizedBox(width: 10.0),
                        Icon(Icons.analytics_outlined),
                        Container(
                          padding: EdgeInsets.all(2.0),
                          width: 50.0,
                          alignment: Alignment.center,
                          child: Text(suggestionList[index].views, ),
                        ),
                        Icon(Icons.access_time_sharp),
                        Container(
                          padding: EdgeInsets.all(2.0),
                          width: 40.0,
                          alignment: Alignment.center,
                          child: Text(suggestionList[index].duration, ),
                        ),


                      ],
                    )
                  ],
                ),
              ),
            ),

            Positioned(
              left: 20.0,
              top: 15.0,
              bottom: 15.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  width: 110,
                  image: AssetImage(suggestionList[index].imageUrl),
                  fit:  BoxFit.cover,
                ),
              ),
            )


          ],
        ),
      ),);
  }
}
