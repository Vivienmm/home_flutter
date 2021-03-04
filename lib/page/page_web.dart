import 'dart:async';

import 'package:chinaso_ui_package/res.dart';
import 'package:chinaso_ui_package/util/date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:home_flutter/entity/history_entity.dart';
import 'package:home_flutter/ui/bottom_web.dart';
import 'package:home_flutter/utils/string_util.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class WebDetail extends StatefulWidget{


  String url;
  String title;
  WebDetail({this.url,this.title});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InfoDetail(url: url,title: title);
  }

}

class InfoDetail extends State<WebDetail>{

  BuildContext mContext;
  Database dataBase;
  String url="https://guangdiu.com/api/showdetail.php";
  int type=0;
  String title="中国搜索";
  InfoDetail({this.url,this.title});

  FlutterWebviewPlugin flutterWebviewPlugin=FlutterWebviewPlugin();
  StreamSubscription<String> _urlchange;
  Future<void> initDataBase() async {
    dataBase = await openDatabase(
      join(await getDatabasesPath(), Strings.CHINASO_DB),
      onCreate: (db, version) => db.execute(
         // "CREATE TABLE "+Strings.HISTORY_TABLE+" (title TEXT , webUrl TEXT PRIMARY KEY, date TEXT)"),
          "CREATE TABLE "+Strings.HISTORY_TABLE+" (title TEXT , webUrl TEXT PRIMARY KEY)"),
      onUpgrade: (db, oldVersion, newVersion) {
        //dosth for migration
        print("old:$oldVersion,new:$newVersion");
      },
      version: 1,
    );

    HistoryEntity entity=new HistoryEntity(title:title,webUrl:url,date: DateUtil.getToday());
     insertHistory(entity, dataBase, Strings.HISTORY_TABLE);

    print("database:$dataBase");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _urlchange=flutterWebviewPlugin.onUrlChanged.listen((loadUrl){
      //WebviewScaffold 加载的url变化时触发此方法
      print(loadUrl);
    });

    //加载错误时监听
    flutterWebviewPlugin.onHttpError.listen((error){
      print(error.code);
    });

    //加载状态变化监听
    flutterWebviewPlugin.onStateChanged.listen((state){
      print(state.type.toString());
    });
    initDataBase();

  }

  @override
  Widget build(BuildContext context) {
    mContext=context;
    // TODO: implement build
    return WebviewScaffold(
                  url: url,
                  withJavascript: true,
                  withLocalStorage: true,
                  withZoom: false,
              bottomNavigationBar:BottomContain() ,
                );

  }

  void backHome() {
    Navigator.pop(mContext);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    dataBase.close();
    flutterWebviewPlugin.close();
    flutterWebviewPlugin.launch(url, hidden: true);
    super.dispose();

  }

  BottomContain() {
    if(type==0){
      return BottomNavigationBar(

          onTap: (int index) {
            switch (index) {
              case 1:
                break;
              case 2:
                backHome();
                break;
              case 4:
                dataBase.close();
                Navigator.pop(mContext);

                Navigator.push(mContext, MaterialPageRoute(builder: (cx)=>BottomMenu(link:url,title: title,)));
                break;
              default:
                break;
            }
            setState(() {
              //  this._currentIndex = index;
            });
          },
          selectedFontSize: 12,
          //fixedColor: Colours.titleColor,
          selectedItemColor: Colours.titleColor,
          unselectedItemColor: Colours.titleColor,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(label: (" "),
              icon: ImageIcon(
                AssetImage('assets/bottom_bar/icon_search_back.png'),),),
            BottomNavigationBarItem(label: (" "),
              icon: ImageIcon(
                AssetImage('assets/bottom_bar/icon_search_next.png'),),),
            BottomNavigationBarItem(label: (" "),
              icon: ImageIcon(
                  AssetImage('assets/bottom_bar/icon_search_home.png')),),
            BottomNavigationBarItem(label: (" "),
              icon: ImageIcon(
                  AssetImage('assets/bottom_bar/icon_search_share.png')),),
            BottomNavigationBarItem(label: (" "),
              icon: ImageIcon(
                  AssetImage('assets/bottom_bar/icon_search_more.png')),),

          ],
        );
    }else{
      return SafeArea(

          child:
          Container(
            decoration: new BoxDecoration(
              color: Colors.transparent,
            ),
           child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child:Material(
                      color: Color(0x80000000),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                        ],
                      ),
                    ),
                  ),
                  Builder(

                    builder:(BuildContext context) {
                      return BottomMenu(link: url,title: title,);
                    },
                  )
                ]),
          ),
    );
    }
  }

}
