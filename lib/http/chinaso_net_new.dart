

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:chinaso_http_package/new/cache_intercept.dart';
import 'package:flutter/cupertino.dart';
import 'package:home_flutter/entity/media_entity.dart';
import 'package:home_flutter/generated/json/media_entity_helper.dart';

/// * @author Suyw
/// * @description:
/// * @date :2021/3/15
 class ChinasoQequest{

   // 在网络请求过程中可能会需要使用当前的context信息，比如在请求失败时
   // 打开一个新路由，而打开新路由需要context信息。
   ChinasoQequest([this.context]) {
     _options = Options(extra: {"context": context});
   }

   BuildContext context;
   Options _options;
   static Dio dio = new Dio(BaseOptions(
     baseUrl: 'https://soapi.chinaso.com/',
     headers: {
       HttpHeaders.acceptHeader: "application/vnd.github.squirrel-girl-preview,"
           "application/vnd.github.symmetra-preview+json",
     },
   ));

   static void init() {
     // 添加缓存插件
     dio.interceptors.add(NetCache());
     // 设置用户token（可能为null，代表未登录）
     // dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;

     // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
//    if (!Global.isRelease) {
//      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//          (client) {
//        client.findProxy = (uri) {
//          return "PROXY 10.1.10.250:8888";
//        };
//        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
//        client.badCertificateCallback =
//            (X509Certificate cert, String host, int port) => true;
//      };
//    }
   }

   //获取用户项目列表
   Future<List<MediaData>> getMediaList(paramsUrl,
       {Map<String, dynamic> queryParameters, //query参数，用于接收分页信息
         refresh = false}) async {
     if (refresh) {
       // 列表下拉刷新，需要删除缓存（拦截器中会读取这些信息）
       _options.extra.addAll({"refresh": true, "list": true});
     }
     var r = await dio.get<List>(
     //  "user/repos",
       paramsUrl,
       queryParameters: queryParameters,
       options: _options,
     );
     MediaEntity mediaEntity;
     return r.data.map((e) => mediaEntityFromJson(mediaEntity,jsonDecode(e))).toList();
   }
 }