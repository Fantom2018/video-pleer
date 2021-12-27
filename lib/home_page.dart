import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
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
            const SizedBox(height: 14.0),
            Container(width: MediaQuery.of(context).size.width,
              height: 220.0,
              padding: EdgeInsets.only(top: 30, left: 10, right: 10),
              decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.AppColor.gradientFirst,
                  color.AppColor.gradientSecond,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(80.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)
                )
              ),
              child: Column(

              ),
            )
          ],

        ),
      ),
    );
  }
}
