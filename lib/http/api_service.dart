import 'dart:convert';

import 'package:chinaso_http_package/net_manager.dart';

import 'net_api_constant.dart';

class ApiInterface {

  /**
   * 获取feed流
   */

  static Future<String> getFeed(int pageNo) async {
    /// 调用封装的NetUtil ，这里合理选择方法即可，比如请求体的方式传参数
    print('http--ss>------getFeed');
    return NetUtil.getJson(HttpConstant.FEED_HOME+'?pageNo=$pageNo',
        jsonEncode({"pageNo":pageNo}).toString());
  }

  static Future<String> getHotNews() async {

    return NetUtil.getJson(HttpConstant.HOT_WORDS,jsonEncode({}).toString());
  }
//  static Future<Map<String, dynamic>> getSmsCode(
//      String flag, String phoneNum, String vefifyCode) async {
//    /// 调用封装的NetUtil ，这里合理选择方法即可，比如请求体的方式传参数
//    return NetUtil.postJson(HttpConstant.FEED_HOME,
//        {"flagId": flag, "phone": phoneNum, "vefifyCode": vefifyCode});
//  }

  /// 在需要进行登录校验的接口上进行LoginInvalidHandler  异常检测
  ///     LoginInvalidHandler handler 带token过期  自动进入登录页的 检测
  /// 这里使用的putForm ，即表单方式传递参数
//  static final String _API_SET_PPWD = "user/set/word";
//
//  static Future<Map<String, dynamic>> tradepassword(LoginInvalidHandler handler,
//      String tradePassword, String checkTradePassword) async {
//    return NetUtil.putForm(_API_SET_PPWD, {
//      'tradePassword': tradePassword,
//      'checkTradePassword': checkTradePassword
//    }).catchError(handler.loginInvalidHandler);
//  }
}