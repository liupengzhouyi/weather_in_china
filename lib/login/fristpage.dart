import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SplashPage(), // 闪屏页
      routes: <String, WidgetBuilder>{ // 路由
        '/HomePage': (BuildContext context) => new HomePage()
      },
    );
  }
}


class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return new Image.asset(
      "images/frist.png",
      // 图片铺满
      fit: BoxFit.cover,
    );
  }

  @override
  void initState() {
    super.initState();
    //开启倒计时
    countDown();
  }

// 倒计时
  void countDown() {
    // 设置倒计时三秒后执行跳转方法
    var _duration = new Duration(seconds: 3);
    new Future.delayed(_duration, go2HomePage);
  }

  void go2HomePage() {
    Navigator.of(context).pushReplacementNamed('/HomePage');
  }
}



class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("Home Page"),
    );
  }
}