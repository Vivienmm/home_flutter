
import 'package:flutter/material.dart';
import 'package:home_flutter/page/home/page_home.dart';
import 'package:weather/citylist_page.dart';


final routers = {
  "/": (context) => MyHomePage(),
  "/location/basicloc": (BuildContext context) => new CityListPage()
//  "/register_page":(context,{arguments}) => RegiseterPage(),
};


