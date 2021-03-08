import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:chinaso_ui_package/res.dart';
import 'package:chinaso_ui_package/widget/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:home_flutter/entity/collection_entity.dart';
import 'package:home_flutter/entity/history_entity.dart';
import 'package:home_flutter/utils/string_util.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:weather/weather_utils.dart';

/// * @author Suyw
/// * @description:
/// * @date :2021/3/4

class CollectionPage extends StatefulWidget {
  CollectionPage({Key key}) : super(key: key);

  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {

  List<CollectionEntity> collections=new List();
  Database dataBase;
  Future<void> initDataBase() async {
    dataBase = await openDatabase(
      join(await getDatabasesPath(), Strings.CHINASO_COL_DB),
      onCreate: (db, version) => db.execute(
          "CREATE TABLE "+Strings.COLLECT_TABLE+" (title TEXT , webUrl TEXT PRIMARY KEY)"),
      onUpgrade: (db, oldVersion, newVersion) {
        //dosth for migration
        print("old:$oldVersion,new:$newVersion");
      },
      version: 1,
    );
    print("database:$dataBase");
    getStudents();
  }

  Future<List<CollectionEntity>> students() async {
    final List<Map<String, dynamic>> maps = await dataBase.query(Strings.COLLECT_TABLE);
    print("database--students()1"+maps[0].toString());
    collections.addAll( List.generate(maps.length, (i) => CollectionEntity.fromJson(maps[i])));
    print("database--students()"+collections[0].webUrl);
    return List.generate(maps.length, (i) => CollectionEntity.fromJson(maps[i]));
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
      appBar:AppBar(title: Text('收藏', style:TextStyle(color: Colours.titleColor)),
        leading: new IconButton(
          icon: new Container(
            padding: EdgeInsets.all(3.0),
            child: new Icon(
              Icons.arrow_back,color: Colours.titleColor,
            ),
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        centerTitle: true,backgroundColor: Colors.white,
        actions: <Widget>[
          InkWell(

            child: Container(
              alignment: Alignment.centerRight,
              child: Text("清空",style:TextStyle(color: Colours.titleColor)),
                ),
            onTap: () {
              _clearCollection();
            },
          ),
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {_clearCollection();},
          ),

        ],) ,

      body:Container(
        height: double.infinity,
        width: double.infinity,
        child: ContentView(collections),
      ) ,
    );



  }

  @override
  void dispose() {
    // TODO: implement dispose
    dataBase.close();
    super.dispose();

  }

  deal(CollectionEntity s) {
    print("history-1"+s.webUrl);
    print("history-2"+s.toJson().toString());
  //  collections.add(s);

  }

  void _clearCollection() {
    dataBase.delete(Strings.COLLECT_TABLE);
    setState(() {
      collections.clear();
    });

  }
}

class ContentView extends StatefulWidget{
  List<CollectionEntity> mCollections=new List();

  ContentView(
      this.mCollections, {
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

    if(widget.mCollections.length>0){

      return ListView.separated(
        shrinkWrap: true, // new line
        separatorBuilder: (context, index) {
          return Container(
            height: 2,
            margin: EdgeInsets.all(10),
            color: Colors.black26,
          );
        },
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.mCollections.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            child: new ListTile(title: Text(widget.mCollections[index].title),subtitle: new Text(widget.mCollections[index].webUrl)),
          );
          //return
          return Text(widget.mCollections[index].title);
        },
      );
    }else{
      return EmptyView();
    }
  }



}


