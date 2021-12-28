import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx2_sample/tab_bar_cotroller.dart';
import 'package:motion_tab_bar/motiontabbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  final controller = Get.put(TabBarController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Obx(() => controller.getIndex() == 0
          ? myPage('Page 1', Colors.yellow)
          : controller.getIndex() == 1
              ? myPage('Page 2', Colors.grey)
              : myPage('Page 3', Colors.blue)),
      bottomNavigationBar: MotionTabBar(
        icons: [
          Icons.contact_mail_sharp,
          Icons.home,
          Icons.wallet_giftcard,
        ],
        tabIconColor: Colors.grey,
        tabSelectedColor: Colors.red,
        labels: ['Contact', 'Home', 'Wallet'],
        initialSelectedTab: 'Home',
        textStyle: TextStyle(color: Colors.red),
        onTabItemSelected: (int val) => controller.setIndex(val),
      ),
    ));
  }

  myPage(String s, Color color) => Container(
        color: color,
        child: Column(
          children: [
            Center(
              child: Text(
                s,
                style: TextStyle(
                    color: color.computeLuminance() < 0.5
                        ? Colors.white
                        : Colors.black),
              ),
            )
          ],
        ),
      );


}
