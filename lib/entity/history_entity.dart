import 'package:azlistview/azlistview.dart';
import 'package:sqflite/sqflite.dart';

/// * @author Suyw
/// * @description: 创建web页历史
/// * @date :2021/3/2
class HistoryEntity extends ISuspensionBean{
  String title;
  String webUrl;
  String date;

  HistoryEntity({
    this.title,
    this.webUrl,
    this.date,
  });
  factory HistoryEntity.fromJson(Map<String, dynamic> parsedJson) {
    return HistoryEntity(
      title: parsedJson['title'],
      webUrl: parsedJson['webUrl'],
      date: parsedJson['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'webUrl': webUrl,
      'date': date,
    };
  }

  @override
  String getSuspensionTag() {
    print("getSuspensionTag"+date);
    return date;
  }
}

// 插入数据库 中的 students 表
Future<void> insertHistory(HistoryEntity std,Database dataBase,String tableName) async {

  await dataBase.insert(
    tableName,
    std.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// 调用插入数据方法
insertData() async {
  var history1 = HistoryEntity(title: '0', webUrl: '张三', date: "2021-02-09");

  // Insert a dog into the database.
  //await insertHistory(history1);
}
