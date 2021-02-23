import 'dart:convert';

import 'package:chinaso_http_package/log_error.dart';
import 'package:chinaso_ui_package/ShadedText.dart';

import 'package:flutter/material.dart';
import 'package:home_flutter/http/city_list_entity.dart';
import 'package:home_flutter/http/home_feed_entity.dart';
import 'package:home_flutter/page/page_channel.dart';
import 'package:home_flutter/page/page_home.dart';
import 'package:home_flutter/page/page_hot.dart';
import 'package:home_flutter/page/page_media.dart';
import 'package:home_flutter/utils/string_util.dart';
import 'package:weather/citylist_page.dart';
import 'package:weather/loc_baidu.dart';
import 'package:weather/weather.dart';
import 'generated/json/feed_data_entity_helper.dart';
import 'generated/json/home_feed_entity_helper.dart';
import 'http/api_service.dart';
import 'http/feed_data_entity.dart';

void main() {
  runApp(MyApp());

//  runApp(new MaterialApp(
//    home: new Home(),
//    routes: {
//      "/location/basicloc": (BuildContext context) => new BasicLoc(), // 基础定位
//    },
//  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);


  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _currentIndex = 0;

  List<Widget> _pageList = [
    MyHomePage(),
    MediaPage(),
    ChannelPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
          toolbarHeight: 10,
          backgroundColor: Colors.white,
        ),
        body: this._pageList[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          currentIndex: this._currentIndex,
          fixedColor: Colors.pink,
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text(Strings.tabIcon1)),
            BottomNavigationBarItem(icon: Icon(Icons.list), title: Text(Strings.tabIcon2)),
            BottomNavigationBarItem(icon: Icon(Icons.people), title: Text(Strings.tabIcon3)),
          ],
        ),
      ),
    routes: {
      "/location/basicloc": (BuildContext context) => new CityListPage(), // 基础定位
    }
    );
  }
}

