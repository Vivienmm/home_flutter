import 'dart:async';

import 'package:chinaso_ui_package/res.dart';
import 'package:chinaso_ui_package/util/date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:home_flutter/entity/history_entity.dart';
import 'package:home_flutter/ui/bottom_web.dart';
import 'package:home_flutter/utils/string_util.dart';
import 'package:sharesdk_plugin/sharesdk_plugin.dart';
import 'package:sharesdk_plugin/sharesdk_register.dart';
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
    initShare();

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
              case 0:
                flutterWebviewPlugin.canGoBack().then((e) {
                  print("su-web"+flutterWebviewPlugin.canGoBack().toString() );
                  if(e){
                    flutterWebviewPlugin.goBack();
                  }else{
                    Navigator.pop(mContext);
                  }

                });


                break;
              case 1:
                if(flutterWebviewPlugin.canGoForward() != null){
                  flutterWebviewPlugin.goForward();
                }
                break;
              case 2:
                backHome();
                break;
              case 3:
                shareFunc();
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

  void initShare() {
    ShareSDKRegister register = ShareSDKRegister();
    register.setupWechat(
        "wx617c77c82218ea2c", "c7253e5289986cf4c4c74d1ccc185fb1", "https://www.sandslee.com/");
    register.setupSinaWeibo("568898243", "38a4f8204cc784f81f9f0daaf31e02e3","http://www.sharesdk.cn","");
    register.setupQQ("100371282", "aed9b0303e3ed1e27bae87c33761161d");
    register.setupFacebook(
        "1412473428822331", "a42f4f3f867dc947b9ed6020c2e93558", "shareSDK");
    register.setupTwitter("viOnkeLpHBKs6KXV7MPpeGyzE",
        "NJEglQUy2rqZ9Io9FcAU9p17omFqbORknUpRrCDOK46aAbIiey", "http://mob.com");
    register.setupLinkedIn("46kic3zr7s4n", "RWw6WRl9YJOcdWsj", "http://baidu.com");
    SharesdkPlugin.regist(register);
  }

  void shareFunc() {
    SSDKMap params2 = SSDKMap()
      ..setGeneral(
        "title",
        "text",
        [""],
        "http://img1.2345.com/duoteimg/qqTxImg/2012/04/09/13339485237265.jpg",
        null,
        "http://www.baidu.com",
        "http://www.mob.com",
        null,
        null,
        null,
        SSDKContentTypes.webpage,
      );

    SharesdkPlugin.showMenu(
        null, params2, (SSDKResponseState state, ShareSDKPlatform platform,
        Map userData, Map contentEntity, SSDKError error) {
      //showAlert(state, error.rawData, context);
    });
  }

}
