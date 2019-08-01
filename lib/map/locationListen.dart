import 'package:amap_location/amap_location.dart';
import 'package:easy_alert/easy_alert.dart';
import 'package:flutter/material.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:weather_in_china/map/main.dart';


class LocationListen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LocationListenState();
}

class _LocationListenState extends State {
  String location;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('监听定位改变'),
        ),
        body: new Center(
          child: new Text(location),
        ));
  }

  void _checkPersmission() async {
    bool hasPermission =
    await SimplePermissions.checkPermission(Permission.WhenInUseLocation);
    if (!hasPermission) {
      PermissionStatus requestPermissionResult =
      await SimplePermissions.requestPermission(
          Permission.WhenInUseLocation);
      if (requestPermissionResult != PermissionStatus.authorized) {
        Alert.alert(context, title: "申请定位权限失败");
        return;
      }
    }
    AMapLocationClient.onLocationUpate.listen((AMapLocation loc) {
      if (!mounted) return;
      setState(() {
        location = getLocationStr(loc);
      });
    });

    AMapLocationClient.startLocation();
  }

  @override
  void initState() {
    location = getLocationStr(null);
    _checkPersmission();

    super.initState();
  }

  @override
  void dispose() {
    //注意这里停止监听
    AMapLocationClient.stopLocation();
    super.dispose();
  }
}