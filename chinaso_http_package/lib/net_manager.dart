import 'dart:convert';
import 'dart:io';



import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class NetUtil {
  static final debug = true;
  static BuildContext context = null;
  /// 服务器路径
  static final host = 'http://xxxxxxxx';
  static final baseUrl = host + '/api/';

  ///  基础信息配置
  static final Dio _dio = new Dio(new Options(
      method: "get",
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      followRedirects: true));

  /// 代理设置，方便抓包来进行接口调节

//  static void setProxy() {
//    _dio.onHttpClientCreate = (HttpClient client) {
//      // config the http client
//      client.findProxy = (uri) {
//        //proxy all request to localhost:8888
//        return "PROXY 192.168.1.151:8888";
//      };
//      // you can also create a new HttpClient to dio
//      // return new HttpClient();
//    };
//  }


  static String token;

  static final LogicError unknowError = LogicError(-1, "未知异常");

  static Future<String> getJson<T>(
      String uri, String paras) =>
      _httpJson("get", uri, data: paras).then(logicalErrorTransform);

  static Future<Map<String, dynamic>> getForm<T>(
      String uri, String paras) =>
      _httpJson("get", uri, data: paras, dataIsJson: false)
          .then(logicalErrorTransform);

  /// 表单方式的post
//  static Future<Map<String, dynamic>> postForm<T>(
//      String uri, Map<String, dynamic> paras) =>
//      _httpJson("post", uri, data: paras, dataIsJson: false)
//          .then(logicalErrorTransform);
//
//  /// requestBody (json格式参数) 方式的 post
//  static Future<Map<String, dynamic>> postJson(
//      String uri, Map<String, dynamic> body) =>
//      _httpJson("post", uri, data: body).then(logicalErrorTransform);
//
//  static Future<Map<String, dynamic>> deleteJson<T>(
//      String uri, Map<String, dynamic> body) =>
//      _httpJson("delete", uri, data: body).then(logicalErrorTransform);
//
//  /// requestBody (json格式参数) 方式的 put
//  static Future<Map<String, dynamic>> putJson<T>(
//      String uri, Map<String, dynamic> body) =>
//      _httpJson("put", uri, data: body).then(logicalErrorTransform);
//
//  /// 表单方式的 put
//  static Future<Map<String, dynamic>> putForm<T>(
//      String uri, Map<String, dynamic> body) =>
//      _httpJson("put", uri, data: body, dataIsJson: false)
//          .then(logicalErrorTransform);

  /// 文件上传  返回json数据为字符串
//  static Future<T> putFile<T>(String uri, String filePath) {
//    var name =
//    filePath.substring(filePath.lastIndexOf("/") + 1, filePath.length);
//    var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
//    FormData formData = new FormData.from({
//      "multipartFile": new UploadFileInfo(new File(filePath), name,
//          contentType: ContentType.parse("image/$suffix"))
//    });
//
//    var enToken = token == null ? "" : Uri.encodeFull(token);
//    return _dio
//        .put<Map<String, dynamic>>("$uri?token=$enToken", data: formData)
//        .then(logicalErrorTransform);
//  }

  static Future<Response<String>> _httpJson(
      String method, String uri,
      {String data, bool dataIsJson = true}) {
    var enToken = token == null ? "" : Uri.encodeFull(token);

    /// 如果为 get方法，则进行参数拼接
    if (method == "get") {
      dataIsJson = true;
      if (data == null) {
        data = " ";
      }
     // data["token"] = token;
    }

    if (debug) {
      print('<net url>------$uri');
      print('<net params>------$data');
    }

    /// 根据当前 请求的类型来设置 如果是请求体形式则使用json格式
    /// 否则则是表单形式的（拼接在url上）
    Options op;

    if (dataIsJson) {
      op = new Options(contentType: ContentType.parse("application/json;charset=utf-8"),responseType: ResponseType.PLAIN);
    } else {
//      op = new Options(
////          contentType: ContentType.parse("application/x-www-form-urlencoded"));
      op = new Options(contentType: ContentType.parse("application/json;charset=utf-8"),responseType: ResponseType.PLAIN);
    }

    op.method = method;

    /// 统一带上token
    print('<request data>------start');


//    _dio.interceptors.add(InterceptorsWrapper(
//        onRequest: (RequestOptions options){
//          print("\n================== 请求数据 ==========================");
//          print("url = ${options.uri.toString()}");
//          print("headers = ${options.headers}");
//          print("params = ${options.data}");
//        },
//        onResponse: (Response response){
//          print("\n================== 响应数据 ==========================");
//          print("code = ${response.statusCode}");
//          print("data = ${response.data}");
//          print("\n");
//        },
//        onError: (DioError e){
//          print("\n================== 错误响应数据 ======================");
//          print("type = ${e.type}");
//          print("message = ${e.message}");
//          print("stackTrace = ${e.stackTrace}");
//          print("\n");
//        }
//    ));
    return _dio.request<String>(
        method == "get" ? uri : "$uri?token=$enToken",
        data: data,
        options: op);

  }

  /// 对请求返回的数据进行统一的处理
  /// 如果成功则将我们需要的数据返回出去，否则进异常处理方法，返回异常信息
  static Future<T> logicalErrorTransform<T>(Response<String> resp) {
    print('<logicalErrorTransform data>------'+resp.data.toString());
    if (resp.data != null) {
      if (200== 200) {

        T realData = resp.data as T;
        return Future.value(realData);
      }
    }
//
//    if (debug) {
//      print('resp--------$resp');
//      print('resp.data--------${resp.data}');
//    }
//
//    LogicError error;
//    if (resp.data != null && resp.data["code"] != 0) {
//      if (resp.data['data'] != null) {
//        /// 失败时  错误提示在 data中时
//        /// 收到token过期时  直接进入登录页面
//        Map<String, dynamic> realData = resp.data["data"];
//        error = new LogicError(resp.data["code"], realData['codeMessage']);
//      } else {
//        /// 失败时  错误提示在 message中时
//        error = new LogicError(resp.data["code"], resp.data["message"]);
//      }
//    } else {
//      error = unknowError;
//    }
    return Future.error(unknowError);
  }

  ///获取授权token
  static getToken() async {
//    String token = await LocalStorage.get(LocalStorage.TOKEN_KEY);
    return " ";
  }
}

/// 统一异常类
class LogicError {
  int errorCode;
  String msg;

  LogicError(errorCode, msg) {
    this.errorCode = errorCode;
    this.msg = msg;
  }
}