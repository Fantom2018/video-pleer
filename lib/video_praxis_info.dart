import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List info =[];

  _initData (){
    DefaultAssetBundle.of(context).loadString("json/videoinfo.json").then((value){
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
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.AppColor.gradientFirst.withOpacity(0.9),
                color.AppColor.gradientSecond,
              ],
              begin: const FractionalOffset(0.0,0.4),
              end: Alignment.topRight,
            ),
         ),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
                width: MediaQuery.of(context).size.width,
                height: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: ()=> Get.back(),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: color.AppColor.secondPageIconColor,
                          ),
                        ),
                        Expanded(child: Container()),
                        Icon(
                          Icons.info_outline,
                          size: 20,
                          color: color.AppColor.secondPageIconColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Text('Legs Toning',
                      style: TextStyle(fontSize: 25,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text('and Gluteal Workout',
                      style: TextStyle(fontSize: 25,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                            width: 90,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                color.AppColor.secondPageContainerGradient1stColor.withOpacity(0.4),
                                color.AppColor.secondPageContainerGradient2ndColor,
                                ],
                                //begin: const FractionalOffset(0.0,0.4),
                                //end: Alignment.topRight,
                              ),
                            ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children:  [
                                  Icon(Icons.timer,
                                  size: 20,
                                  color: color.AppColor.secondPageIconColor,
                                  ),
                                  //const SizedBox(height: 6.0),
                                  Text('60 min',
                                  style: TextStyle(fontSize: 14,
                                  color: color.AppColor.secondPageIconColor),
                                  )
                                ],
                              ),
                          ),
                          ],

                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Container(
                            width: 230,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                color.AppColor.secondPageContainerGradient1stColor.withOpacity(0.4),
                                color.AppColor.secondPageContainerGradient2ndColor,
                                ],
                                //begin: const FractionalOffset(0.0,0.4),
                                //end: Alignment.topRight,
                              ),
                            ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children:  [
                                  Icon(Icons.handyman_outlined,
                                    size: 20,
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  Text('Resistant band, Kettlebell',
                                    style: TextStyle(fontSize: 14,
                                        color: color.AppColor.secondPageIconColor),
                                  )
                                ],
                              ),
                          ),
                          ],

                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ),
            Expanded(
              child:
              Container(
                padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Circuit 1: Legs Toning',
                        style: TextStyle(
                          fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: color.AppColor.circuitsColor
                        ),),
                        Expanded(child: Container()),
                        Icon(Icons.loop, color: color.AppColor.loopColor,),
                        const SizedBox(width: 10.0),
                        Text('3 sets',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: color.AppColor.setsColor
                            ))
                      ],
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ));
  }
}
