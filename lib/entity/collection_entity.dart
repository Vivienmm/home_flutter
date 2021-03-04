import 'package:sqflite/sqflite.dart';

/// * @author Suyw
/// * @description:
/// * @date :2021/3/4
class CollectionEntity {
  String title;
  String webUrl;


  CollectionEntity({
    this.title,
    this.webUrl,

  });
  factory CollectionEntity.fromJson(Map<String, dynamic> parsedJson) {
    return CollectionEntity(
      title: parsedJson['title'],
      webUrl: parsedJson['webUrl'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'webUrl': webUrl,

    };
  }


}

// 插入数据库 中的 students 表
Future<void> insertCollection(CollectionEntity std,Database dataBase,String tableName) async {

  await dataBase.insert(
    tableName,
    std.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> deleteCollection(String url,Database dataBase,String tableName) async {

  await dataBase.delete(
    tableName,
    where: ( "webUrl = ?"),
    whereArgs: [url],
  );
}


Future<bool> searchCollection(String url,Database dataBase,String tableName) async {
  List<Map<String, dynamic>> maps = List();
  maps = await dataBase.query(
    tableName,
    where: ( "webUrl = ?"),
    whereArgs: [url],

  );
  // map转换为List集合
//  return List.generate(maps.length, (i) {
//    return CollectionEntity.fromJson(maps[i]);
//  });
if (maps.length>0){
  return true;
}else{
  return false;
}
}

