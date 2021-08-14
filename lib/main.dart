import 'package:flutter/material.dart';
import 'package:mynote/mine.dart';
import 'package:mynote/study.dart';

import 'home.dart';
import 'mynote.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My note',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My note Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _currentIndex=0;

  final List<Widget> _pageList = [
    MyHomeWidget(),
    MyNoteWidget(),
    MyStudyWidget(),
    MyMineWidget(),

  ];

  final List<BottomNavigationBarItem> _bottomList = [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: "home",backgroundColor:Colors.blue ),
  BottomNavigationBarItem(icon: Icon(Icons.message), label: "note",backgroundColor:Colors.green ),
  BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "study",backgroundColor:Colors.amber ),
  BottomNavigationBarItem(icon: Icon(Icons.person), label: "mine",backgroundColor:Colors.red ),
  ];

  var _pageController =  PageController(initialPage: 0);

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter = _counter + 2;
    });
  }

  void _incrementCounter2() {
    Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return MyStudyWidget();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),


      bottomNavigationBar:Container(
          height: 112,
          child:Column(children: [
        BottomNavigationBar(
          items:_bottomList,
          //这是底部导航栏自带的位标属性，表示底部导航栏当前处于哪个导航标签。给他一个初始值0，也就是默认第一个标签页面。
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.shifting,
          onTap: (int i){
            setState(() {
              _currentIndex=i;
            });
            _pageController.animateToPage(_currentIndex, duration:  Duration(seconds: 2),curve: ElasticOutCurve(0.8));
          },
        ),
        BottomNavigationBar(
          items:_bottomList,
          //这是底部导航栏自带的位标属性，表示底部导航栏当前处于哪个导航标签。给他一个初始值0，也就是默认第一个标签页面。
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (int i){
            setState(() {
              _currentIndex=i;
            });
            _pageController.animateToPage(_currentIndex, duration:  Duration(seconds: 2),curve: ElasticOutCurve(0.8));

          },
        )

      ],
        ///主轴居中,即是竖直向居中
        mainAxisAlignment: MainAxisAlignment.end,
      )),
      body:PageView(children:_pageList ,onPageChanged:(int i){
        setState(() {
          _currentIndex=i;
        });
      } ,controller: _pageController,),// _pageList[_currentIndex],
      floatingActionButton:_currentIndex==0? FloatingActionButton(
        onPressed: _incrementCounter2,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ):null,// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



