import 'package:flutter/material.dart';
import 'package:amap_location/amap_location.dart';
import 'package:weather_in_china/map/home.dart';
import 'package:weather_in_china/map/locationGet.dart';
import 'package:weather_in_china/map/locationListen.dart';

void main() {
  /*============*/
  //设置android的key
  /*=============*/
  //AMapLocationClient.setApiKey("a5bae506b2d053ed4ae7827f38b1766d");
  /*============*/
  //设置ios的key
  /*=============*/
  AMapLocationClient.setApiKey("903d468423f2f9f9c9a34fe854fe4f87");

  runApp(new MaterialApp(
    home: new Home(),
    routes: {
      "/location/get": (BuildContext context) => new LocationGet(),
      "/location/listen": (BuildContext content) => new LocationListen()
    },
  ));
}









