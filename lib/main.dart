//导入包  导入了Material UI组件库。Material是一种标准的移动端和web端的视觉设计语言， Flutter默认提供了一套丰富的Material风格的UI组件。
import 'package:flutter/material.dart';
//导包，这是在pubspec.yaml中添加了依赖的三方包
import 'package:english_words/english_words.dart';

import 'main_list.dart';

//应用程序入口  =>是Dart中单行函数或方法的简写
void main()=> runApp(MyApp());

//这个widget是应用程序的根。在Flutter中，大多数东西都是widget（后同“组件”或“部件”），包括对齐(alignment)、填充(padding)和布局(layout)等，它们都是以widget的形式提供

class MyApp extends StatelessWidget {

  Map<String, WidgetBuilder> routes;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //应用名称
      title: 'Flutter Demo',
      initialRoute:"/", //名为"/"的路由作为应用的home(首页)
      // 应用程序主题，尝试修改Colors颜色，点击热加载按钮
      theme: ThemeData(
        primarySwatch: Colors.green,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      //注册路由表
      routes:{
        "/":(context) => MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由
        "start_flutter":(context) => MainListPage(title: "一级列表")
      },

      //应用程序首页路由
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//首页
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // Fields in a Widget subclass are always marked "final".
  final String title;

  //StatefulWidget类本身是不变的，但是State类中持有的状态在widget生命周期中可能会发生变化。
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/**
 * 构建UI界面的逻辑在build方法中，当MyHomePage第一次创建时，_MyHomePageState类会被创建，
 * 当初始化完成后，Flutter框架会调用Widget的build方法来构建widget树，
 * 最终将widget树渲染到设备屏幕上。
 */
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  //定义一个函数
  void _incrementCounter() {
    //函数中调用setStat通知Flutter框架，有状态发生了改变
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //build方法会在setState方法调用后执行
    //Scaffold是Material库中提供的页面脚手架，它提供了默认的导航栏、标题和包含主屏幕widget组件树的body属性
    return Scaffold(
      appBar: AppBar(
        //页面标题
        title: Text(widget.title),
      ),
      body: Center( // Center是一个布局组件.Center 可以将其子组件树对齐到屏幕中心
        child: Column( // Column也是布局组件layout widget. 作用是将其所有子组件沿屏幕垂直方向依次排列
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              child: Text("点我开始学习Flutter<一级列表>"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                //通过路由注册表路由名打开新路由页面
                Navigator.pushNamed(context, "start_flutter");
                //传递参数
                //Navigator.of(context).pushNamed("start_flutter", arguments: "hi");
                //下一个页面获取路由参数
                //var args=ModalRoute.of(context).settings.arguments;

                //原始路由方式
//                Navigator.push( context,
//                    MaterialPageRoute(builder: (context) {
//                       return MainListPage(title: "一级列表");
//                    }));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(   //右下角按钮
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
