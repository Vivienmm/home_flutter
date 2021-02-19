
import 'package:flutter/material.dart';
import 'package:home_flutter/page/page_home.dart';
import 'package:weather/loc_baidu.dart';

final routers = {
  "/": (context) => MyHomePage(),
 // "/travel_detail_widget":(context,{arguments}) => TravelDetailWidget(),
  "/location/basicloc": (BuildContext context) => new BasicLoc()
//  "/register_page":(context,{arguments}) => RegiseterPage(),
};