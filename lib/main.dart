
import 'package:chinaso_ui_package/util/date_util.dart';
import 'package:flutter/material.dart';
import 'package:home_flutter/page/home/page_channel.dart';
import 'package:home_flutter/page/home/page_home.dart';
import 'package:home_flutter/page/media/page_media.dart';
import 'package:home_flutter/utils/string_util.dart';
import 'package:weather/citylist_page.dart';
import 'package:mmkv/mmkv.dart';


Future<void> main() async {
  final rootDir = await MMKV.initialize();
  print('MMKV for flutter with rootDir = $rootDir');
  runApp(MyApp());

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
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }
  Future<void> initPlatformState() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {});
    var kv = MMKV.defaultMMKV();
    bool isFirstUser=kv.decodeBool("isFirst");
    if(!isFirstUser){
      kv.encodeBool("isFirst",true);
      kv.encodeString("firstDate",  DateUtil.getToday());
    }

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
          toolbarHeight: 10,
          backgroundColor: Colors.white,
          elevation: 0,
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

