import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info =[];

  _initData (){
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value){
      info = json.decode(value);
    });
  }

  @override
  void initState(){
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.AppColor.homePageBackground,
        body: Container(
          padding: const EdgeInsets.only( left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Training',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: color.AppColor.homePageTitle),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: color.AppColor.homePageIcons,
                  ),
                  const SizedBox(width: 20.0),
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 20,
                    color: color.AppColor.homePageIcons2,
                  ),
                  const SizedBox(width: 20.0),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: color.AppColor.homePageIcons,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Text(
                    'Your Programs',
                    style: TextStyle(fontSize: 16,  color: color.AppColor.homePageTitle),
                  ),
                  Expanded(child: Container()),
                  Text(
                    'Details',
                    style: TextStyle(fontSize: 12, color: color.AppColor.homePageDetail),
                  ),
                  const SizedBox(width: 20.0),
                  Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: color.AppColor.homePageIcons,
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              //участок с кнопкой
              Container(width: MediaQuery.of(context).size.width,
                height: 220.0,
                decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.gradientFirst.withOpacity(0.7),
                    color.AppColor.gradientSecond.withOpacity(0.9),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(50.0)
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(5, 10),
                      blurRadius: 15,
                      color: color.AppColor.gradientThird.withOpacity(0.3),
                    )
                  ]
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Next Workout",
                        style: TextStyle(
                            fontSize: 16.0,
                          color: color.AppColor.homePageContainerTextSmall,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      const Text('Legs Toning',
                      style: TextStyle(fontSize: 25,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                      ),
                      const SizedBox(height: 4.0),
                      const Text('and Gluteal Workout',
                      style: TextStyle(fontSize: 25,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(

                            children: const [
                              Icon(Icons.timer, size: 20, color: color.AppColor.homePageContainerTextSmall,),
                              SizedBox(width: 20.0),
                              Text('60 min',
                                style: TextStyle(fontSize: 16,
                                  color: color.AppColor.homePageContainerTextSmall,
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60.0),
                              boxShadow: [
                                BoxShadow(
                                  color: color.AppColor.gradientFirst,
                                  blurRadius: 10,
                                  offset: Offset(5,10),
                                )
                              ]
                            ),
                            child: Icon(Icons.play_circle_fill,
                              size: 60,
                              color: color.AppColor.homePageContainerTextSmall, ),
                          ),
                        ],
                      )
                    ],
                    
                  ),
                ),

              ),
              const SizedBox(height: 5.0),
              // Участок девушка
              Container(
                height: 180.0,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin:  const EdgeInsets.only(top: 30),
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/card.jpg",
                          ),
                          fit: BoxFit.fill
                        ),
                        boxShadow: [
                          BoxShadow(
                          blurRadius: 40,
                            offset: const Offset(7, 10),
                            color: color.AppColor.gradientSecond.withOpacity(0.3),
                        ),
                          BoxShadow(
                            blurRadius: 8,
                            offset: const Offset(-2, -4),
                            color: color.AppColor.gradientSecond.withOpacity(0.2),
                          ),
                        ],

                      ),
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 200, bottom: 30),
                      decoration: BoxDecoration(
                        //color: Colors.lightGreen.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20.0),
                        image: const DecorationImage(
                            image: AssetImage(
                              "assets/figure.png",
                            ),
                            //fit: BoxFit.fill
                        ),


                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 100,
                      //color: Colors.amberAccent.withOpacity(0.3),
                      margin: const EdgeInsets.only(left: 150, top: 50),
                      child: Column(
                        //mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("You are doing greate",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.homePageDetail,
                          ),
                          ),
                          const SizedBox(height: 10.0),
                          RichText(
                            text: TextSpan(
                              text: "keep it up \n",
                              style: TextStyle(
                                fontSize: 16,
                                //fontWeight: FontWeight.bold,
                                color: color.AppColor.homePagePlanColor,
                              ),
                              children: const [
                                TextSpan(
                                text: "stic to your plan",
                               /* style: TextStyle(
                                  fontSize: 16,
                                  //fontWeight: FontWeight.bold,
                                  color: color.AppColor.homePagePlanColor,*/
                                ),
                              ]
                            ),
                          ),
                        ],
                      ),                    
                    ),

                  ],
                ),
              ),
              Row(
                  children: [
                    Text(
                      'Area of focus',
                      style: TextStyle(
                          fontSize: 25,
                          color: color.AppColor.homePageTitle,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 10.0, ),
              Expanded(child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: (info.length.toDouble()/2).toInt(),
                  itemBuilder: (_, i){
                      int a = 2*i;
                      int b = 2*i+1;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width:(MediaQuery.of(context).size.width-60)/2,
                            margin: const EdgeInsets.only(top: 10, bottom: 5) ,
                            padding: const EdgeInsets.only(bottom: 7.0),

                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(
                                  info[a]['img'],
                                )
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(5,5),
                                  color: color.AppColor.gradientSecond.withOpacity(0.1),
                                ),
                                BoxShadow(
                                  blurRadius: 5,
                                  offset: Offset(-6,-6),
                                  color: color.AppColor.gradientSecond.withOpacity(0.3),
                                )
                              ]
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                    info[a]['title'],
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: color.AppColor.homePageDetail,
                                ),),
                              ),
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width-60)/2,
                            margin: const EdgeInsets.only(top: 10, bottom: 5),
                            height: 150,
                            padding: const EdgeInsets.only(bottom: 7.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(
                                      info[b]['img'],
                                    )
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: const Offset(-5,-5),
                                    color: color.AppColor.gradientSecond.withOpacity(0.1),
                                  ),
                                  BoxShadow(
                                    blurRadius: 5,
                                    offset: const Offset(-6,-6),
                                    color: color.AppColor.gradientSecond.withOpacity(0.3),
                                  )
                                ]
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[b]['title'],
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: color.AppColor.homePageDetail,
                                  ),),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
              ))
            ],

          ),
        ),
      ),
    );
  }
}
