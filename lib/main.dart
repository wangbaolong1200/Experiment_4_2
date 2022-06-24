/*
* 仿写知识点：
* 1、填充（Padding）
* 2、装饰容器（DecoratedBox）
* 3、容器组件（Container）
* 4、页面骨架（Scaffold）
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(WBLMaterialApp());

class WBLMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WBLHome(),
    );
  }
}

class WBLHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "实验4_2",
        ),
      ),
      body: WBLBody(),
    );
  }
}

//WBLBody前不加_，暴露给其它人使用
class WBLBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return functionSelection();
  }
}

class functionSelection extends StatelessWidget {
  //功能选择
  //按钮函数
  Widget functionButton(BuildContext context, String text, Widget func) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: TextStyle(
                fontSize: 30,
              ),
              minimumSize: Size(300, 60)),
          child: Text(text),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return NewRoute(func);
              }),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        functionButton(context, '填充', test1()),
        SizedBox(
          height: 20,
        ), //使上下之间有间距
        functionButton(context, '装饰容器', test2()),
        SizedBox(
          height: 20,
        ), //使上下之间有间距
        functionButton(context, '容器组件', test3()),
        SizedBox(
          height: 20,
        ), //使上下之间有间距
        functionButton(context, '页面骨架', ScaffoldRoute()),
      ],
    );
  }
}

class NewRoute extends StatelessWidget {
  late Widget func;

  NewRoute(Widget func) : super() {
    this.func = func;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text(""),
          ),
      body: Center(
        child: func,
      ),
    );
  }
}

class test1 extends StatelessWidget {
  //填充（Padding）
  const test1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      //上下左右各添加16像素补白
      padding: const EdgeInsets.all(16),
      child: DefaultTextStyle(
        //1.设置文本默认样式
        style: TextStyle(
          color: Colors.red,
          fontSize: 40.0,
        ),
        textAlign: TextAlign.start,
        child: Column(
          //显式指定对齐方式为左对齐，排除对齐干扰
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Padding(
              //左边添加8像素补白
              padding: EdgeInsets.only(left: 8),
              child: Text("Hello world"),
            ),
            Padding(
              //上下各添加8像素补白
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text("I am Jack"),
            ),
            Padding(
              // 分别指定四个方向的补白
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text("Your friend"),
            )
          ],
        ),
      ),
    );
  }
}

class test2 extends StatelessWidget {
  //装饰容器（DecoratedBox）
  Widget decoratedButton() {
    //装饰容器
    return DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red, Colors.orange.shade700]), //背景渐变
            borderRadius: BorderRadius.circular(3.0), //3像素圆角
            boxShadow: [
              //阴影
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0)
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
          child: Text(
            "装饰容器测试",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return decoratedButton();
  }
}

class test3 extends StatelessWidget { //容器组件（Container）
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
        ),
        Container(
          margin: EdgeInsets.only(top: 50.0, left: 120.0),
          constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
          //卡片大小
          decoration: BoxDecoration(
            //背景装饰
            gradient: RadialGradient(
              //背景径向渐变
              colors: [Colors.red, Colors.orange],
              center: Alignment.topLeft,
              radius: .98,
            ),
            boxShadow: [
              //卡片阴影
              BoxShadow(
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0,
              )
            ],
          ),
          transform: Matrix4.rotationZ(.2),
          //卡片倾斜变换
          alignment: Alignment.center,
          //卡片内文字居中
          child: Text(
            //卡片文字
            "6.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
          ),
        ),
        SizedBox(
          height: 100,
        ),
        Container(
          margin: EdgeInsets.all(20.0), //容器外补白
          color: Colors.orange,
          child: Text("Hello world!"),
        ),
        Container(
          padding: EdgeInsets.all(20.0), //容器内补白
          color: Colors.orange,
          child: Text("Hello world!"),
        ),
      ],
    );
  }
}

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //导航栏
        title: Text("App Name"),
        actions: <Widget>[ //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      drawer: MyDrawer(), //抽屉
      bottomNavigationBar: BottomNavigationBar( // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton( //悬浮按钮
          child: Icon(Icons.add),
          onPressed:_onAdd
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onAdd(){
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "images/avatar.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
