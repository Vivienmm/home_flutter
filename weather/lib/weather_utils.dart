import 'package:chinaso_ui_package/res.dart';
import 'package:flutter/material.dart';
import 'package:weather/data/city_list_entity.dart';
class Utils {
  static Widget getSusItem(BuildContext context, String tag,
      {double susHeight = 40}) {
    if (tag == '★') {
      tag = '★ 热门城市';
    }
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16.0),
      color: Color(0xFFF3F4F5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$tag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Colours.indicatorSelectedColor,
        ),
      ),
    );
  }

  static Widget getListItem(BuildContext context, CityListum model,
      {double susHeight = 40}) {
    return ListTile(
      title: Text(model.city),
      onTap: () {
        Navigator.pop(context,model.city);
       // Utils.showSnackBar(context, 'onItemClick : ${model.city}');
      },
    );

  }

  static void showSnackBar(BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 2),
      ),
    );
  }

}