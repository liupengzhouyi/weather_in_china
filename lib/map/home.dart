import 'package:amap_location/amap_location.dart';
import 'package:amap_location/amap_location_option.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    //启动客户端,这里设置ios端的精度小一点
    AMapLocationClient.startup(new AMapLocationOption(
        desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
    super.initState();
  }

  @override
  void dispose() {
    //注意这里关闭
    AMapLocationClient.shutdown();
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
      leading: null,
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
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('高德地图定位'),
        ),
        body: new Scrollbar(
            child: new ListView(
              children: render(context, [
                {
                  "title": "直接获取定位",
                  "subtitle": "不需要先启用监听就可以直接获取定位",
                  "url": "/location/get"
                },
                {"title": "监听定位", "subtitle": "启动定位改变监听", "url": "/location/listen"}
              ]),
            )));
  }
}