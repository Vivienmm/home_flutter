
import 'package:chinaso_ui_package/refresh_indicator.dart';
import 'package:chinaso_ui_package/vertical_scroll.dart';
import 'package:chinaso_ui_package/vertical_scroll_txt.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home_flutter/generated/json/home_feed_entity_helper.dart';
import 'package:home_flutter/http/api_service.dart';
import 'package:home_flutter/page/page_feed.dart';
import 'package:home_flutter/ui/search_bar_delegate.dart';
import 'package:scroll_text/scroll_text.dart';
import 'package:weather/weather.dart';

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

                  delegate: BarDelegate(

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
