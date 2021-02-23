
import 'package:chinaso_ui_package/refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:home_flutter/generated/json/home_feed_entity_helper.dart';
import 'package:home_flutter/http/api_service.dart';
import 'package:home_flutter/page/page_feed.dart';

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
                            FlutterLogo(),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "作者:Jaynm",
                              style: TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "在普通的ScrollView中，有一组条子（滚动视图的组成部分）。如果这些条中的一个托管了一个TabBarView，它沿相反的方向滚动（例如，允许用户在标签所代表的页面之间水平滑动，而列表则垂直滚动），则TabBarView内部的任何列表都不会与外部ScrollView交互。。例如，浏览内部列表以滚动到顶部不会导致外部ScrollView中的SliverAppBar折叠 而展开。",
                          style: TextStyle(color: Colors.black, fontSize: 16),
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
      height: 48,
      padding: EdgeInsets.only(left: 15, right: 15),
      color: Colors.grey[200],
      child: Row(
        children: <Widget>[
          Text(
            "赞：1020",
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "评论：100",
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "转发：10",
              ),
            ),
          )
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
