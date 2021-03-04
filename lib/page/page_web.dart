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

  int type=0;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InfoDetail(url: url,title: title);
  }

}

class InfoDetail extends State<WebDetail>{
  List<String> nameItems = <String>[
    '添加收藏',
    '收藏列表',
    '复制链接',
    '刷新',
  ];
  BuildContext mContext;
  Database dataBase;
  String url="https://guangdiu.com/api/showdetail.php";
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();
  String title="中国搜索";
  InfoDetail({this.url,this.title});

  FlutterWebviewPlugin flutterWebviewPlugin=FlutterWebviewPlugin();
  StreamSubscription<String> _urlchange;
  Future<void> initDataBase() async {
    dataBase = await openDatabase(
      join(await getDatabasesPath(), Strings.CHINASO_DB),
      onCreate: (db, version) => db.execute(
          "CREATE TABLE "+Strings.HISTORY_TABLE+" (title TEXT , webUrl TEXT PRIMARY KEY, date TEXT)"),
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

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 1,
        backgroundColor: Colors.white,
//            title: Text("详情页"),
//            leading: IconButton(
//                icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
//                onPressed: (){
//                  Navigator.pop(context);
//                }),
      ),

      bottomNavigationBar:BottomContain(),



        body: Builder(
        builder: (BuildContext context) {
          mContext=context;
          return Container(
            height: double.infinity,
            decoration: new BoxDecoration(
              color: Colors.red,
            ),
            child: Column(
              children: [
                Expanded(child: WebviewScaffold(
                  key: _bottomSheetScaffoldKey,

                  url: url,
                  withJavascript: true,
                  withLocalStorage: true,
                  withZoom: false,
                ),
                ),
              ],

            )
          );

        }
      ),
      );

  }

  void backHome() {
    Navigator.pop(mContext);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    dataBase.close();
    super.dispose();

  }


  _openBottomSheet() {


    setState(() {
      widget.type=1;
    });

//    showModalBottomSheet(
//      context: mContext,
//      builder: (context){
//        return Container(
//          width: 414,
//          height: 300,
//          color: Colors.red,
//          alignment: Alignment.centerLeft,
//          child: BottomMenu(),
//        );
//      },
//    );

//    Scaffold.of(mContext)
//        .showBottomSheet<Null>((BuildContext context) {
//       return BottomMenu();
//    });
  }

  BottomContain() {
    if(widget.type==0){
      return BottomNavigationBar(

          onTap: (int index) {
            switch (index) {
              case 1:
                break;
              case 2:
                backHome();
                break;
              case 4:
                setState(() {
                  widget.type=1;
                });
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
      return Container(
        height: 120.0,
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
              child: new Container(
                height: 60.0,
                child: new GridView.builder(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 5.0,
                      childAspectRatio: 1.0),
                  itemBuilder: (BuildContext context, int index) {
                    return new Column(
                      children: <Widget>[
                        new Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
                            child: Icon(
                              Icons.copy,
                              size:20,
                            )),
                        new Text(nameItems[index])
                      ],
                    );
                  },
                  itemCount: nameItems.length,
                ),
              ),
            ),
            new Container(
              height: 0.5,
              color: Colors.blueGrey,
            ),
            new Center(
              child: new Padding(
                padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                child: GestureDetector(
                    onTap:(){
                      widget.type=0;
                      setState(() {

                      });
                    },
                    child: new Text(
                      '取  消',
                      style: new TextStyle(fontSize: 18.0, color: Colors.blueGrey),
                    )),
              ),
            ),
          ],
        ),
      );
    }
  }
}

