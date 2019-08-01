import 'package:flutter/material.dart';
import 'package:amap_location/amap_location.dart';
import 'package:weather_in_china/map/home.dart';
import 'package:weather_in_china/map/locationGet.dart';
import 'package:weather_in_china/map/locationListen.dart';

void main() {
  /*============*/
  //设置ios的key
  /*=============*/
  AMapLocationClient.setApiKey("a5bae506b2d053ed4ae7827f38b1766d");
  /*============*/
  //设置ios的key
  /*=============*/

  runApp(new MaterialApp(
    home: new Home(),
    routes: {
      "/location/get": (BuildContext context) => new LocationGet(),
      "/location/listen": (BuildContext content) => new LocationListen()
    },
  ));
}



String getLocationStr(AMapLocation loc) {
  if (loc == null) {
    return "正在定位";
  }

  if (loc.isSuccess()) {
    if (loc.hasAddress()) {
      return "定位成功: \n时间${loc.timestamp}\n经纬度:${loc.latitude} ${loc.longitude}\n 地址:${loc.formattedAddress} 城市:${loc.city} 省:${loc.province}";
    } else {
      return "定位成功: \n时间${loc.timestamp}\n经纬度:${loc.latitude} ${loc.longitude}\n ";
    }
  } else {
    return "定位失败: \n错误:{code=${loc.code},description=${loc.description}";
  }
}






