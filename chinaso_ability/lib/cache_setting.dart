import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
/// * @author Suyw
/// * @description:缓存计算以及清除
/// * @date :2021/3/1
 class CacheSetting {
   /// 递归方式 计算文件的大小
   static Future<double> _getTotalSizeOfFilesInDir(
       final FileSystemEntity file) async {
     try {
       if (file is File) {
         int length = await file.length();
         return double.parse(length.toString());
       }
       if (file is Directory) {
         final List<FileSystemEntity> children = file.listSync();
         double total = 0;
         if (children != null)
           for (final FileSystemEntity child in children)
             total += await _getTotalSizeOfFilesInDir(child);
         return total;
       }
       return 0;
     } catch (e) {
       print(e);
       return 0;
     }
   }


   static Future _clearCache() async {
     //此处展示加载loading
     try {
       Directory _tempDir = await getTemporaryDirectory();
       double value = await _getTotalSizeOfFilesInDir(_tempDir);
       print("$value");
       if (value <= 0) {
         Fluttertoast.showToast(msg: '暂无缓存');
       } else if (value >= 0) {
         Future.delayed(Duration(seconds: 2), () async {
           //删除缓存目录
           await delDir(_tempDir);
           await loadCache();

           Fluttertoast.showToast(msg: '清理完成');
         });
       }
     } catch (e) {
       print(e);
       Fluttertoast.showToast(msg: '清除缓存失败');
     } finally {}
   }


   ///递归方式删除目录
   static Future<Null> delDir(FileSystemEntity file) async {
     try {
       if (file is Directory) {
         final List<FileSystemEntity> children = file.listSync();
         for (final FileSystemEntity child in children) {
           await delDir(child);
         }
       }
       await file.delete();
     } catch (e) {
       print(e);
     }
   }

   ///加载缓存
   static Future<Null> loadCache() async {
     try {
       Directory _tempDir = await getTemporaryDirectory();
       double value = await _getTotalSizeOfFilesInDir(_tempDir);
       /*tempDir.list(followLinks: false,recursive: true).listen((file){
          //打印每个缓存文件的路径
        print(file.path);
      });*/
       print('临时目录大小: ' + value.toString());
       return _renderSize(value);
     } catch (err) {
       print(err);
     }
   }

   ///格式化文件大小
   static String _renderSize(double value) {
     if (null == value) {
       return "0";
     }
     List<String> unitArr = List()
       ..add('B')..add('K')..add('M')..add('G');
     int index = 0;
     while (value > 1024) {
       index++;
       value = value / 1024;
     }
     String size = value.toStringAsFixed(2);
     return size + unitArr[index];
   }


   static String CacheSize() {
     Future<Null> loadCache() async {
       try {
         Directory _tempDir = await getTemporaryDirectory();
         double value = await _getTotalSizeOfFilesInDir(_tempDir);
         /*tempDir.list(followLinks: false,recursive: true).listen((file){
          //打印每个缓存文件的路径
        print(file.path);
      });*/
         print('临时目录大小: ' + value.toString());
         return _renderSize(value);
       } catch (err) {

       }
     }
   }
 }