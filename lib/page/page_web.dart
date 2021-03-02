import 'dart:async';

import 'package:chinaso_ui_package/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:home_flutter/utils/string_util.dart';

class WebDetail extends StatefulWidget{


  String url;
  WebDetail({this.url});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InfoDetail(url: url);
  }

}

class InfoDetail extends State<WebDetail>{


  String url="https://guangdiu.com/api/showdetail.php";

  InfoDetail({this.url});

  FlutterWebviewPlugin flutterWebviewPlugin=FlutterWebviewPlugin();
  StreamSubscription<String> _urlchange;

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
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebviewScaffold(
          appBar: AppBar(
            toolbarHeight: 1,
            backgroundColor:Colors.white ,
//            title: Text("详情页"),
//            leading: IconButton(
//                icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
//                onPressed: (){
//                  Navigator.pop(context);
//                }),
          ),

          url: url,
          withJavascript: true,
          withLocalStorage: true,
          withZoom: false,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          switch(index){
            case 1:

              break;
            case 2:
              backHome();
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
          BottomNavigationBarItem(label: (" "),icon: ImageIcon(AssetImage('assets/bottom_bar/icon_search_back.png'),),),
          BottomNavigationBarItem(label: (" "),icon:ImageIcon(AssetImage('assets/bottom_bar/icon_search_next.png'), ), ),
          BottomNavigationBarItem(label: (" "),icon:ImageIcon(AssetImage('assets/bottom_bar/icon_search_home.png')), ),
          BottomNavigationBarItem(label: (" "),icon:ImageIcon(AssetImage('assets/bottom_bar/icon_search_share.png')), ),
          BottomNavigationBarItem(label: (" "),icon:ImageIcon(AssetImage('assets/bottom_bar/icon_search_more.png')), ),

        ],
      ),
    );
  }

  void backHome() {
    Navigator.pop(context);
  }

}