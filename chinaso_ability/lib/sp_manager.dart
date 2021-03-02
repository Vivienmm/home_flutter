/// * @author Suyw
/// * @description:SharedPrference 操作
/// * @date :2021/3/2

import 'package:flutter/material.dart';

import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _incrementCounter() async {
  await SharedPreferences.getInstance();
}

class LocalStore{
  Future<void> setstr(String key,String value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
  Future<String> getstr(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
  Future<void> clearstr(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}





