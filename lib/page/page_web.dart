import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ItemInfoDetail extends StatefulWidget{


  String url;
  ItemInfoDetail({this.url});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InfoDetail(url: url);
  }

}

class InfoDetail extends State<ItemInfoDetail>{


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
        title: Text("详情页"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
            onPressed: (){
              Navigator.pop(context);
            }),
      ),
      url: url,
      withJavascript: true,
      withLocalStorage: true,
      withZoom: false,
    );
  }

}