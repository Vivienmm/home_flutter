
import 'package:chinaso_http_package/net_manager.dart';
import 'package:weather/weather_constant.dart';

class WeatherApiInterface {

  static Future<String> getWeather(String city) async {
    /// 调用封装的NetUtil ，这里合理选择方法即可，比如请求体的方式传参数
    return NetUtil.getJson(WeatherConstant.WEATHER,
        {"city":city}.toString());
  }

  static Future<String> getCityList(String order) async {
    /// 调用封装的NetUtil ，这里合理选择方法即可，比如请求体的方式传参数
    return NetUtil.getJson(WeatherConstant.CITY,
        {"order":order}.toString());
  }
}