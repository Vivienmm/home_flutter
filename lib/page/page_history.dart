import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:chinaso_ui_package/widget/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:home_flutter/entity/history_entity.dart';
import 'package:home_flutter/utils/string_util.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:weather/weather_utils.dart';

/// * @author Suyw
/// * @description:
/// * @date :2021/3/2

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  List<HistoryEntity> historys=new List();
  Database dataBase;
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
    print("database:$dataBase");
    getStudents();
  }

  Future<List<HistoryEntity>> students() async {
    final List<Map<String, dynamic>> maps = await dataBase.query(Strings.HISTORY_TABLE);
    print("database--students()1"+maps[0].toString());
    historys.addAll( List.generate(maps.length, (i) => HistoryEntity.fromJson(maps[i])));
    print("database--students()"+historys[0].webUrl);
    return List.generate(maps.length, (i) => HistoryEntity.fromJson(maps[i]));
  }

// 转为 string 输出
  getStudents() async {
    await students()
        .then((list) => list.forEach((s) => deal(s)));
    setState(() {
        //print("database--his"+historys.length.toString());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDataBase();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(title: Text('浏览历史'), centerTitle: true,backgroundColor: Colors.black12,
        actions: <Widget>[
          InkWell(
            child: Text("清空"),
            onTap: () {},
          ),
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {},
          ),

        ],) ,

      body:ContentView(historys) ,
    );



  }

  @override
  void dispose() {
    // TODO: implement dispose
    dataBase.close();
    super.dispose();

  }

  deal(HistoryEntity s) {
    print("history-1"+s.webUrl);
    print("history-2"+s.toJson().toString());
    historys.add(s);

    //Map<String, dynamic> responseDataInner =  jsonDecode(jsonEncode(responseData["data"]));
   // HomeFeedEntity entity=new HomeFeedEntity();
    //homeFeedEntityFromJson(entity,responseDataInner);

   // print("history-3"+HistoryEntity.fromJson(jsonDecode(jsonEncode(s))).title);

    //historys.add(HistoryEntity.fromJson(jsonDecode(jsonEncode(s.toJson()))))));
  }
}

class ContentView extends StatefulWidget{
   List<HistoryEntity> mHistorys=new List();

   ContentView(
      this.mHistorys, {
        Key key,
      })  :
        super(key: key);


  @override
  _ContentViewState createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    if(widget.mHistorys.length>0){
      sortListByDate(widget.mHistorys);
      setShowSuspensionStatus(widget.mHistorys);
      return SafeArea(
        child:Column(
          children: [
            Expanded(
              child: AzListView(
                data: widget.mHistorys,
                itemCount: widget.mHistorys.length,
                itemBuilder: (BuildContext context, int index) {
                  HistoryEntity model = widget.mHistorys[index];
                  return getListItem(context, model);
                },
                padding: EdgeInsets.zero,

                susItemBuilder: (BuildContext context, int index) {
                  HistoryEntity model = widget.mHistorys[index];
                  String tag = model.getSuspensionTag();
                  return getSusItem(context, tag);
                },
                  indexBarData:[],
              ),
            ),
          ],
        ),

      );
    }else{
      return EmptyView();
    }
  }

  Widget getListItem(BuildContext context, HistoryEntity model) {
    print(model.getSuspensionTag()+model.isShowSuspension.toString());
    return ListTile(
      title: Text("中国搜索"),
      subtitle:Text(model.webUrl) ,
      onTap: () {
       // Navigator.pop(context,model.city);
        // Utils.showSnackBar(context, 'onItemClick : ${model.city}');
      },
    );
  }

  Widget getSusItem(BuildContext context, String tag, {double susHeight = 40}) {
    print("getSusItem"+tag);
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16.0),
      color: Color(0xFFF3F4F5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$tag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF666666),
        ),
      ),
    );
  }

  void sortListByDate(List<ISuspensionBean> list) {
    print("sort"+list.length.toString());
    if (list == null || list.isEmpty) return;
    list.sort((a, b) {
      if (a.getSuspensionTag() == "@" || b.getSuspensionTag() == "#") {
        return -1;
      } else if (a.getSuspensionTag() == "#" || b.getSuspensionTag() == "@") {
        return 1;
      } else {

        return a.getSuspensionTag().compareTo(b.getSuspensionTag());
      }
    });
  }

  /// 设置显示悬停Header状态。
 void setShowSuspensionStatus(List<ISuspensionBean> list) {
    if (list == null || list.isEmpty) return;
    String tempTag;
    for (int i = 0, length = list.length; i < length; i++) {
      String tag = list[i].getSuspensionTag();

      print("tag"+tag);
      if (tempTag != tag) {

        tempTag = tag;
        list[i].isShowSuspension = true;
      } else {
        list[i].isShowSuspension = false;
      }
    }
  }

}


