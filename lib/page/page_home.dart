
import 'package:chinaso_ui_package/refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home_flutter/generated/json/home_feed_entity_helper.dart';
import 'package:home_flutter/http/api_service.dart';
import 'package:home_flutter/page/page_feed.dart';
import 'package:weather/weather.dart';

import '../utils/string_util.dart';
import 'page_default.dart';
import 'dart:convert';

import 'package:chinaso_http_package/log_error.dart';
import 'package:chinaso_ui_package/ShadedText.dart';

import 'package:flutter/material.dart';
import 'package:home_flutter/http/home_feed_entity.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int pageNo=0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;

    });
  }

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: Colors.white,

        body: RefreshIndicator2(
          notificationPredicate: (notifation) {
            return true;
          },
          onRefresh: () {
            return Future.delayed(Duration(seconds: 2), () {
              return true;
            });
          },
          child: NestedScrollView(
            headerSliverBuilder: (contex, _) {
              return [
                //sliver
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[

                            Container(
                              width: 180,
                              height: 70,
                              child: WeatherHome(),
                            ),
                            Flexible(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.topRight,

                                child:  InkWell(
                                  onTap: (){
                                      print("点击了 ");

                                     Fluttertoast.showToast(
                                         msg:  "点击设置",
                                         toastLength: Toast.LENGTH_SHORT,
                                         gravity: ToastGravity.CENTER,
                                         timeInSecForIos: 1,
                                         backgroundColor: Colors.red,
                                         textColor: Colors.white,
                                         fontSize: 16.0
                                     );
                                     },
                                  child: Container(
                                    width: 15,
                                    height: 15,
                                    margin: EdgeInsets.only(right: 15),
                                    child: Image.asset(
                                      'assets/setting_icon.png'
                                  ),
                                ),
                              ),
                            ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),

                       Align(
                          alignment: Alignment.center,

                          child: Container(
                            width: 146,
                            height: 34,
                            child: Image.asset(
                                'assets/home_logo.png'
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),

                SliverPersistentHeader(

                  delegate: MyDelegate(

                  ),
                  pinned: true,

                ),
              ];
            },
            body: new FeedNews(),
          ),
        ),
      );

  }
}
class MyDelegate extends SliverPersistentHeaderDelegate {


  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {

    return Container(
      height: 50,
      margin: EdgeInsets.only(left:10,right:10,bottom: 10),
      padding: EdgeInsets.only(left: 15, right: 15),
      decoration: new BoxDecoration(
        //color: Colors.red,

        //border: new Border.all(width: 2.0, color: Colors.red),
        //borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        image: new DecorationImage(

          image: new AssetImage('assets/input_bg.png'),
          //这里是从assets静态文件中获取的，也可以new NetworkImage(）从网络上获取
          centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
        ),
      ),

      child: Row(

        children: <Widget>[
          Text(
            "搜新闻 上国搜",
          ),
          SizedBox(
            width: 15,
          ),

          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,

              child: Container(
                width: 15,
                height: 24,
                child: Image.asset(
                    'assets/voice_symbol.png'
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 58;

  @override
  double get minExtent => 55;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
