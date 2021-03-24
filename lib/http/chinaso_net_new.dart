

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:chinaso_http_package/new/cache_intercept.dart';
import 'package:flutter/cupertino.dart';
import 'package:home_flutter/entity/media_entity.dart';
import 'package:home_flutter/entity/media_news_entity.dart';
import 'package:home_flutter/generated/json/media_entity_helper.dart';
import 'package:home_flutter/generated/json/media_news_entity_helper.dart';

/// * @author Suyw
/// * @description:
/// * @date :2021/3/15
 class ChinasoRequest{

   // 在网络请求过程中可能会需要使用当前的context信息，比如在请求失败时
   // 打开一个新路由，而打开新路由需要context信息。
   ChinasoRequest([this.context]) {
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

   //获取媒体列表
   //https://soapi.chinaso.com/general/v1/om/media/list
   Future<List<MediaData>> getMediaList(paramsUrl,
       {Map<String, dynamic> queryParameters, //query参数，用于接收分页信息
         refresh = false}) async {

     if (refresh) {
       // 列表下拉刷新，需要删除缓存（拦截器中会读取这些信息）
       _options.extra.addAll({"refresh": true, "list": true});
     }
     var r = await dio.get<String>(
       paramsUrl,
       queryParameters: queryParameters,
       options: _options,
     );

     MediaEntity mediaEntity=new MediaEntity();

     mediaEntityFromJson(mediaEntity,jsonDecode(r.toString()));
     return mediaEntity.data;
   }

 /**
  * 获取媒体新闻列表
  * https://soapi.chinaso.com/general/v1/search?accountid=2803301701&order=time&start_index=0&rn=15
  */

   Future<List<MediaNewsDataData>> getMediaCommonNewsList(paramsUrl,
       {Map<String, dynamic> queryParameters, //query参数，用于接收分页信息
         refresh = false}) async {

     if (refresh) {
       // 列表下拉刷新，需要删除缓存（拦截器中会读取这些信息）
       _options.extra.addAll({"refresh": true, "list": true});
     }
     var r = await dio.get<String>(
       paramsUrl,
       queryParameters: queryParameters,
       options: _options,
     );


     MediaNewsEntity mediaNewsEntity=new MediaNewsEntity();
     mediaNewsEntityFromJson(mediaNewsEntity,jsonDecode(r.toString()));
     print("medisss-"+mediaNewsEntity.data.data[0].title);
     return mediaNewsEntity.data.data;
   }

 }