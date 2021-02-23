library weather;

import 'dart:convert';

import 'package:chinaso_http_package/log_error.dart';
import 'package:chinaso_ui_package/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/data/city_list_entity.dart';
import 'package:weather/json/city_list_entity_helper.dart';
import 'package:weather/json/weather_entity_helper.dart';

import 'package:weather/weather_api.dart';
import 'package:weather/data/weather_entity.dart';


class WeatherHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WeatherHomeState();
  }
}

class _WeatherHomeState extends State<WeatherHome> {
  String imageUrl=" ";
  String city="北京";
  String weather=" ";
  String quality=" ";
  WeatherReal entityReal=new WeatherReal();



  Future getWeather(String  city) {

    /// 调用
    WeatherApiInterface.getWeather(
        city) .then((data) {
      /// 请求成功 进行成功的逻辑处理
      print('http--ss>------请求成功');
      Map<String, dynamic> responseData =  jsonDecode(data);

      Map<String, dynamic> responseDataInner =  jsonDecode(jsonEncode(responseData["data"]));
      print('http--weathers>------responseDataInner'+ responseDataInner.toString());

      WeatherEntity entity=new WeatherEntity();
      weatherEntityFromJson(entity,responseDataInner);
      city=entity.city;

      print('http--weathers>------real请求成功'+responseDataInner["real"].toString());


      weatherRealFromJson(entityReal,jsonDecode(jsonEncode(responseDataInner["real"])));
      imageUrl=entityReal.weatherIcon[0];
      weather=entityReal.weather;
      print('http--weathers>------real解析'+imageUrl);

      WeatherAqiInfo info=new WeatherAqiInfo();
      weatherAqiInfoFromJson(info,jsonDecode(jsonEncode(responseDataInner["aqiInfo"])));
      quality=info.quality;
      setState(() {

      });

    }).catchError((errorMsg) {
      /// 请求失败 dio异常
      print('http--ss>------请求失败'+errorMsg);
      /// 请求失败  进入了自定义的error拦截
      if (errorMsg is LogicError) {
        LogicError logicError = errorMsg;

      } else {

      }
    });
  }


  @override
  void initState() {
    super.initState();
    getWeather("北京市");
  }

  @override
  void dispose() {
    //注意这里关闭
    super.dispose();
  }

  List<Widget> render(BuildContext context, List children) {
    return ListTile.divideTiles(
        context: context,
        tiles: children.map((dynamic data) {
          return buildListTile(
              context, data["title"], data["subtitle"], data["url"]);
        })).toList();
  }

  Widget buildListTile(
      BuildContext context, String title, String subtitle, String url) {

    return new ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(url);
      },
      isThreeLine: true,
      dense: false,
      leading: CircleAvatar(

        backgroundImage: NetworkImage(imageUrl),
      ),
      title: new Text(title),
      subtitle: new Text(subtitle),
      trailing: new Icon(
        Icons.arrow_right,
        color: Colors.blueAccent,
      ),

    );
  }

  @override
  Widget build(BuildContext context) {

//    return new Scaffold(
//
//        body: new Scrollbar(
//            child: new ListView(
//              children:
//                  render(context, [
//                {
//                  "title": city,
//                  "subtitle": weather,
//                  "url": "/location/basicloc"
//                },
//              ]),
//
//            )));

    return Container(
      height: 70,
      padding: EdgeInsets.only(top: 15,bottom: 10),
      margin: EdgeInsets.only(right: 15),
      child: Row(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize :MainAxisSize.max,
        children: <Widget>[
          Image(
            height: 50,
            width: 50,
            image:NetworkImage(imageUrl) ,
          ),
          Expanded(

            child: Column(

              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize :MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: 20,
                  padding: EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text(city,
                        style: TextStyle(
                          color: Colours.weatherColor,
                          fontSize: 12,
                        ),
                      ),
                      Container(
                        width: 20,
                        child: Image.asset( 'assets/home_logo.png'),
                      ),

                    ],
                  )
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(entityReal.temper+"℃··"+entityReal.weather+"·"+quality,
                      style: TextStyle(
                        color: Colours.weatherColor,
                        fontSize: 10,
                      )),
                  //  margin: EdgeInsets.only(left: 60),
                )

              ],

            ),
          )


        ],


      ),


    );
  }
}