
import 'package:chinaso_ui_package/refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
                              height: 50,
                              child: WeatherHome(),
                            ),
                            Flexible(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.topRight,

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

                  delegate: MyDelegate(),
                  pinned: true,
                ),
              ];
            },
            body: new FeedNews(),
          ),
        ),
      );

//    return NestedScrollView(
//      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//        return <Widget>[SliverAppBar(
//          expandedHeight: 230.0,
//          pinned: true,
//          flexibleSpace: FlexibleSpaceBar(
//            title: Text('复仇者联盟'),
//            background: Image.network(
//              'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
//              fit: BoxFit.fitHeight,
//            ),
//          ),
//        )];
//      },
//      body: new FeedNews(),
////      body: ListView.builder(itemBuilder: (BuildContext context,int index){
////        return Container(
////          height: 80,
////          color: Colors.primaries[index % Colors.primaries.length],
////          alignment: Alignment.center,
////          child: Text(
////            '$index',
////            style: TextStyle(color: Colors.white, fontSize: 20),
////          ),
////        );
////      },itemCount: 20,),
//    );
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also a layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.headline4,
//            ),
//            ShadedText(
//              text: 'Shaded Text',
//              textColor: Color(0xffff0000),
//              shadeColor: Color(0xff00ff00),
//              shadeBuilder: (BuildContext context, String text, Color color) =>
//                  Container(
//                    child: Text(
//                      text,
//                      style: TextStyle(color: color),
//                    ),
//                  ),
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
  }
}
class MyDelegate extends SliverPersistentHeaderDelegate {

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 70,
      margin: EdgeInsets.only(left:10,right:10,bottom: 10),
      padding: EdgeInsets.only(left: 15, right: 15),
      decoration: new BoxDecoration(
        color: Colors.white,
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
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
