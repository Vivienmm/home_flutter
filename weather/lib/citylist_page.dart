import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:chinaso_http_package/log_error.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:weather/data/city_list_entity.dart';
import 'package:weather/json/city_list_entity_helper.dart';
import 'package:weather/weather_api.dart';
import 'package:weather/weather_utils.dart';

import 'object_util.dart';

class CityListPage extends StatefulWidget {
  @override
  _CityListPageState createState() => _CityListPageState();
}

class _CityListPageState extends State<CityListPage> {
  List<CityListum> showList = [];
  List<CityListum> originList = [];
 // List<CityListum> _hotCityList = [];

  @override
  void initState() {
    super.initState();

    SuspensionUtil.setShowSuspensionStatus(showList);

    getCityList();
  }


  Future getCityList() {

    /// 调用
    WeatherApiInterface.getCityList(
        "py") .then((data) {
      /// 请求成功 进行成功的逻辑处理

      Map<String, dynamic> responseData =  jsonDecode(data);

      Map<String, dynamic> responseDataInner =  jsonDecode(jsonEncode(responseData["data"]));

      CityListEntity entity=new CityListEntity();
      cityListEntityFromJson(entity,responseDataInner);

      List<CityListum> listums=new List<CityListum>();

      ((responseDataInner["A"]) as List).forEach((v) {

        print('http--ss>------city-v'+v.toString());
        CityListum num=new CityListum();
        cityListumFromJson(num,jsonDecode(jsonEncode(v)));
        originList.add(num);
      //  listums.add(new CityListum().fromJson(v));
      });
      ((responseDataInner["B"]) as List).forEach((v) {

        CityListum num=new CityListum();
        cityListumFromJson(num,jsonDecode(jsonEncode(v)));
        originList.add(num);

      });
      ((responseDataInner["C"]) as List).forEach((v) {

        CityListum num=new CityListum();
        cityListumFromJson(num,jsonDecode(jsonEncode(v)));
        originList.add(num);

      });

      _handleList(originList);

    }).catchError((errorMsg) {
      /// 请求失败 dio异常
      print('http--ss>------请求失败'+errorMsg.toString());
      /// 请求失败  进入了自定义的error拦截
      if (errorMsg is LogicError) {
        LogicError logicError = errorMsg;

      } else {

      }
    });
  }


  void _handleList(List<CityListum> list) {

    showList.clear();

    if (ObjectUtil.isEmpty(list)) {
      setState(() {});
      return;
    }

    for (int i = 0, length = list.length; i < length; i++) {

      String pinyin = PinyinHelper.getPinyinE(list[i].city);
      String tag = pinyin.substring(0, 1).toUpperCase();
      if (RegExp('[A-Z]').hasMatch(tag)) {
        list[i].code = tag;
      } else {
        list[i].code = '#';
      }
    }

    showList.addAll(list);
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(showList);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(showList);

    setState(() {});
  }

  Widget header() {
    return Container(
      color: Colors.white,
      height: 44.0,
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
                autofocus: false,
                onChanged: (value) {
                  _search(value);
                },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, right: 10),
                border: InputBorder.none,
                labelStyle: TextStyle(fontSize: 14, color: Color(0xFF333333)),
                hintText: '城市中文名或拼音',
                hintStyle: TextStyle(fontSize: 14, color: Color(0xFFCCCCCC))),
          )),
          Container(
            width: 0.33,
            height: 14.0,
            color: Color(0xFFEFEFEF),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "取消",
                style: TextStyle(color: Color(0xFF999999), fontSize: 14),
              ),
            ),
          )
        ],
      ),
    );
  }


  void _search(String text) {
    if (ObjectUtil.isEmpty(text)) {
      _handleList(originList);
    } else {
      List<CityListum> list = originList.where((v) {
        return v.pinyin.toLowerCase().contains(text.toLowerCase());
      }).toList();
      _handleList(list);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        children: [
          header(),
          Expanded(
            child: Material(
              color: Color(0x80000000),
              child: Card(
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
                shape: const RoundedRectangleBorder(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0)),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 15.0),
                      height: 50.0,
                      child: Text("当前城市: 北京市"),
                    ),
                    Expanded(
                      child: AzListView(
                        data: showList,
                        itemCount: showList.length,
                        itemBuilder: (BuildContext context, int index) {
                          CityListum model = showList[index];
                          return Utils.getListItem(context, model);
                        },
                        padding: EdgeInsets.zero,
                        susItemBuilder: (BuildContext context, int index) {
                          CityListum model = showList[index];
                          String tag = model.getSuspensionTag();
                          return Utils.getSusItem(context, tag);
                        },
                        indexBarData: ['★', ...kIndexBarData],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
