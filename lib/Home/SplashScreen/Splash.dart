import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Const/Dimension.dart';
import '../Translate.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> with SingleTickerProviderStateMixin{

  var subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;
  late Animation<double> animation;
  late AnimationController controller;
  String? UserId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(vsync: this,duration: const Duration(seconds: 4))..forward();
    animation=CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    loadData();

  }
  @override
  void dispose() {
    subscription.cancel();
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void loadData(){

    Timer(Duration(seconds: 5), () {  Get.offAll(HomePage());});
    // Get.off(HomePage());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/y2019-06-11-27_generated.jpg"),fit: BoxFit.fill)),
          //     foregroundDecoration: BoxDecoration(
          //
          // )
          //     ,
          //     // child:
          //     // Image(image: AssetImage("assets/images/motorbike-rider-with-helmet-browsing-mobile-phone1.png"),fit: BoxFit.fill,)
          // ),

          Center(
            child: ScaleTransition(scale: animation,
              child: Container(height: D.Hight/4,width: D.Hight/3,
                decoration:  const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/y2019-06-11-27_generated.png",
                        ),
                        fit: BoxFit.fill)),
              ),
            ),
          ),
        ],
      ),
    );
  }



}
