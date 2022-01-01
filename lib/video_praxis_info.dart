import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:video_player/video_player.dart';
import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo =[];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;

  _initData ()async{
    await DefaultAssetBundle.of(context).loadString("json/videoinfo.json").then((value){
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState(){
    super.initState();
    _initData();
  }

  @override
  void dispose(){
    _disposed=true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();

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
              child:
              _playArea==false?Container(
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
                    const SizedBox(height: 4.0),
                    Text('and Gluteal Workout',
                      style: TextStyle(fontSize: 25,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),),
                    const SizedBox(height: 20.0),
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
              ):Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Padding(

                      padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Row(
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
                    ),
                    SizedBox(height: 10.0,),
                    _playView(context),
                    _controlView(context),
                    ],
                ),
              ),
            ),
           Expanded(
              child:
              Container(
                padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                              )),
                        ],

                      ),
                    const SizedBox(height: 10.0),

                    Expanded(
                        child: _listView(),)

                  ],
                ),
              )
            )
          ],
        ),
      ));
  }

  String convertTwo (int value){
    return value < 10? "0$value" : "$value";
  }

 Widget _controlView(BuildContext context){
    final noMute = (_controller?.value.volume??0)>0;

    final duration = _duration?.inSeconds??0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration -head);
    final mins = convertTwo(remained ~/ 60.0);
    final secs = convertTwo(remained % 60);

    return Container(
      height: 65.0,
      width: MediaQuery.of(context).size.width,
      child: Column(
        
        children: [
          /*Expanded(child: Row()),*/
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 15,
            child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: const Color(0xFF1E90FF),
                  inactiveTrackColor: const Color(0xFF979AAA),
                  trackShape: const RoundedRectSliderTrackShape(),
                  trackHeight: 2.0,
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  thumbColor: const Color(0xFF1E90FF),
                  overlayColor: const Color(0xFFCCCCFF).withAlpha(52),
                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
                  tickMarkShape: const RoundSliderTickMarkShape(),
                  activeTickMarkColor: Colors.red,
                  inactiveTickMarkColor: Color(0xFFDF73FF),
                  valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                  valueIndicatorColor: const Color(0xFF293133),
                  valueIndicatorTextStyle: const TextStyle(color: Colors.white)
                ),
                child: Slider(
                  value: max(0, min(_progress*100, 100)),
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label:_position.toString().split(".") [0],
                  onChanged: (value) {
                    setState(() {
                      _progress=value*0.01;
                    });
                    //n?.toString().split("."[0])
                  },
                  onChangeStart: (value){
                    _controller!.pause();
                  },
                  onChangeEnd: (value){
                    final duration = _controller?.value.duration;
                    if(_duration!=null){
                      var newValue = max(0, min(value, 99))*0.01;
                      var millis = (duration!.inMilliseconds*newValue).toInt();
                      _controller?.seekTo(Duration(milliseconds: millis));
                      _controller?.play();
                    }
                  },
                )),
          ),
          Expanded(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 8,),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      /*boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0 , 0.0),
                          blurRadius: 4.0,
                          color: Colors.lightBlue)Color(0xff0d47a1))]*/
                    ),
                    child: Icon(
                        noMute?Icons.volume_up:Icons.volume_off,
                        size: 26, color: Colors.white),
                  ),
                ),
                onTap: (){
                  if(noMute){
                    _controller?.setVolume(0);
                  }else{
                    _controller?.setVolume(1.0);
                  }
                  setState(() {

                  });
                },
              ),
              /*SizedBox(width: 10,),*/
              TextButton(
                  onPressed: () async {
                    final index = _isPlayingIndex-1;
                    if(index>=0&&videoInfo.length >=0){
                      _initializeVideo(index);
                    }else{
                      Get.snackbar("Video", "It's first video");
                    }
                  },
                  child: Icon(Icons.fast_rewind, size: 30, color: Colors.white,),
                 ),
              TextButton(
                onPressed: () async {

                  if(_isPlaying){
                    setState(() {
                      _isPlaying=false;
                    });
                    _controller?.pause();
                  }else {
                    setState(() {
                      _isPlaying=true;
                    });
                    _controller?.play();
                  }
                },
                child: Icon(_isPlaying?Icons.pause: Icons.play_arrow, size: 30,),
              ),
              TextButton(
                onPressed: () async {
                  final index = _isPlayingIndex+1;
                  if(index<=videoInfo.length -1){
                    _initializeVideo(index);
                  }else{
                    Get.snackbar("Video List", "",
                    snackPosition: SnackPosition.BOTTOM,
                      icon: Icon(Icons.face, size: 25, color: Colors.white,),
                      backgroundColor: color.AppColor.gradientSecond,
                      colorText: Colors.white,
                      messageText: Text(
                        "Sorry, It's last video",
                        style: TextStyle(
                          fontSize: 20, color: Colors.white,
                        ),
                      ),
                    );

                  }
                },
                child: Icon(Icons.fast_forward, size: 30, color: Colors.white,),
              ),
              Text(
                "$mins:$secs",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              )
            ],
        ),
          )],
      ),
    );
  }

  _playView(BuildContext context){
    final controller =_controller;
    if (controller != null&&controller.value.isInitialized){
      return AspectRatio(
        aspectRatio: 16/9,
        child: VideoPlayer(controller),
      );
    }else{
      return AspectRatio(aspectRatio: 16/9,
        child: Center(
            child: Text ("Preparring ...", style: TextStyle(
              fontSize: 20.0, color: Colors.white
            ),),
        ),
      );
    }
  }


  var _onUpdatecontrollerTime;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;

  void _onControllerUpdate() async{
    if(_disposed){
      return;
    }
    _onUpdatecontrollerTime =0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if(_onUpdatecontrollerTime>now){
      return;
    }
    _onUpdatecontrollerTime = now+500;

    final controller =_controller;
    if(controller==null){
      debugPrint("Controller is Null");
      return ;
    }
    if(!controller.value.isInitialized){
      debugPrint("Controller is not initialized");
      return ;
    }
    if(_duration == null){
      _duration = _controller?.value.duration;
    }
    var duration = _duration;
    if(duration ==null) return;

    var position = await controller.position;
    _position = position;


    final playing = controller.value.isPlaying;
    if(playing){
      if(_disposed) return;
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble()/ duration.inMilliseconds.ceilToDouble();
      });
    }

    _isPlaying =playing;
  }

  _initializeVideo(int index) async{
    final controller = VideoPlayerController.network(videoInfo[index]["videoUrl"]);
    final old =_controller;
    _controller = controller;
    if(old!=null){
      old.removeListener(_onControllerUpdate);
    }

    setState(() {});
    controller..initialize().then((_){
      old?.dispose();
      _isPlayingIndex=index;
      _controller!.addListener(_onControllerUpdate);
      controller.play();
      setState(() {});
    });
  }

  _onTapVideo(int index){
    _initializeVideo(index);
  }
  //width: MediaQuery.of(context).size.width,
  //color: Colors.red,



  _listView(){
    return  ListView.builder(
        itemCount: videoInfo.length,
        itemBuilder: (_, int index){
          return GestureDetector(
            onTap: (){
              _onTapVideo(index);
              debugPrint(index.toString());
              setState(() {
                if (_playArea ==false){
                  _playArea =true;
                }
                //info = json.decode(value);
              });
            },
            child: _buildCard(index),
          );
        }) ;
  }

  _buildCard(int index){
    return  Container(
      height: 120,
      width: 200,
      color: Colors.white70,
      margin: EdgeInsets.only(bottom: 3.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: AssetImage(
                            videoInfo[index]["thumbnail"]
                        ),
                        fit: BoxFit.cover
                    )
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo[index]['title'],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    videoInfo[index]['time'],
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300
                    ),
                  )],
              )

            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(

                width: 80,
                height: 20,
                decoration: BoxDecoration(
                    color: Color(0xffe1e7fb),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: const Center(
                  child: Text(
                    //videoInfo[index]['time'],
                    '15 sec rest',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),

              ),
              SizedBox(width: 5.0),
              Row(
                children: [
                  Container(
                    //width:3,
                    height: 20,
                    child: Text(
                        '- - - - - - - - - - - - - - - - - - -'
                    ),
                    /* decoration: BoxDecoration(
                                            color: Colors.red,
                                          borderRadius: BorderRadius.circular(3),
                                        ),*/
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
