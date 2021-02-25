import 'package:flutter/material.dart';
import 'package:grovegi/Model/DataModel.dart';
import 'package:grovegi/config/Size/SizeConfig.dart';
import 'package:grovegi/config/constant/AppColor.dart';

class DataSearch extends SearchDelegate<String>{
  final datas = [
    DataModel(title: "Stock market for beginners", duration: "10:30" , description: "Description", type: "new" , imageUrl: "assets/images/tshirt.png", views: "817K"),
    DataModel(title: "Stock markets", duration: "10:30" , description: "Description", type: "new" , imageUrl: "assets/images/tshirt.png",views: "817K"),
    DataModel(title: "Stock Fundamental", duration: "10:30" , description: "Description", type: "new" , imageUrl: "assets/images/tshirt.png",views: "817K"),
    DataModel(title: "Stock market for beginners", duration: "10:30" , description: "Description", type: "new" , imageUrl: "assets/images/tshirt.png",views: "817K"),
    DataModel(title: "Stock market for pro", duration: "10:30" , description: "Description", type: "new" , imageUrl: "assets/images/tshirt.png",views: "817K"),
    DataModel(title: "Fundamentals of Stock Market", duration: "10:30" , description: "Description", type: "new" , imageUrl: "assets/images/tshirt.png",views: "817K"),
    DataModel(title: "What is Stock Market?", duration: "10:30" , description: "Description", type: "new" , imageUrl: "assets/images/tshirt.png",views: "817K"),
    DataModel(title: "Stock Market | L1", duration: "10:30" , description: "Description", type: "new" , imageUrl: "assets/images/tshirt.png",views: "817K"),
    DataModel(title: "Stock Market | L2", duration: "10:30" , description: "Description", type: "new" , imageUrl: "assets/images/tshirt.png",views: "817K"),
    DataModel(title: "Stock Market | L3", duration: "10:30" , description: "Description", type: "new" , imageUrl: "assets/images/tshirt.png",views: "817K"),
    DataModel(title: "Stock Market | L4", duration: "10:30" , description: "Description", type: "new" , imageUrl: "assets/images/tshirt.png",views: "817K"),
  ];
  final recentPlayList = [    DataModel(title: "Stock Market | L1", duration: "10:30" , description: "Description", type: "new" , imageUrl: "assets/images/tshirt.png",views: "817K"),
    DataModel(title: "Stock Market | L2", duration: "10:30" , description: "Description", type: "new" , imageUrl: "assets/images/tshirt.png",views: "817K"),];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear, ), onPressed: (){
        query = "";

      },),
      IconButton(icon: Icon(Icons.mic, ), onPressed: (){},)
    ];
    throw UnimplementedError();
  }


  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,progress: transitionAnimation,),onPressed: (){
      close(context, null);
    },);

    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?recentPlayList:datas.where((element) => element.title.toLowerCase().contains(query)).toList();
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
                          child: RichText(
                            text: TextSpan(text: suggestionList[index].title.substring(0,query.length), style:TextStyle(fontSize: 18.0,
                              fontWeight: FontWeight.w600,color: Colors.black),
                              children: [
                                TextSpan(text: suggestionList[index].title.substring(query.length), style:TextStyle(fontSize: 18.0,
                            fontWeight: FontWeight.w600, color: Colors.grey))
                              ]

                          ),
                          )

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
    throw UnimplementedError();
  }
  


}