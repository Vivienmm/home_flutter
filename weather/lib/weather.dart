library weather;

import 'dart:convert';

import 'package:chinaso_http_package/log_error.dart';
import 'package:chinaso_ui_package/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/citylist_page.dart';
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
      Map<String, dynamic> responseData =  jsonDecode(data);

      Map<String, dynamic> responseDataInner =  jsonDecode(jsonEncode(responseData["data"]));

      WeatherEntity entity=new WeatherEntity();
      weatherEntityFromJson(entity,responseDataInner);
      city=entity.city;

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
    entityReal.temper="0";
    entityReal.weather="晴";
    getWeather("北京市");
  }

  @override
  void dispose() {
    //注意这里关闭
    super.dispose();
  }


  _toTransferForResult(BuildContext context) async {
    final dataFromOtherPage = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CityListPage()),
    ) as String;
    print("返回数据"+dataFromOtherPage);
    city=dataFromOtherPage;
    getWeather(city);
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        _toTransferForResult(context);
        //Navigator.of(context).pushNamed("/location/basicloc");
      },
      child:Container(
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
                        textDirection:TextDirection.ltr ,
                        children: [
                          Container(
                            width: 10,
                            child: Image.asset( 'assets/loc_symbol.png'),
                          ),
                          Text(city,
                            style: TextStyle(
                              color: Colours.weatherColor,
                              fontSize: 12,
                            ),
                          ),


                        ],
                      )
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(entityReal.temper+"℃·"+entityReal.weather+"·"+quality,
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

      ) ,
    );
  }
}