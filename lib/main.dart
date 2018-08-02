import 'package:flutter/material.dart';
import 'package:estructura_1/pantallas/categorias.dart';
import 'package:estructura_1/pantallas/listado.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Aviles',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
      home: Categorias(),
      initialRoute: '/categorias',
      routes: {
        '/categorias': (context) => Categorias(),
//        '/favoritos': (context) => Favoritos(),
//        '/detalle': (context) => Detalle(),
        '/listado': (context) => Listado(),
      },
    );
  }
}
/*
class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var selectedPageIndex = 0;

  var pages = [
    Categorias(),
//    SearchPage(),
//    NotificationPage(),
//    MessagesPage(),
  ];*/

/*  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: pages[selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          title: Text(""),
          icon: new Icon (Icons.home, color: selectedPageIndex == 0? Colors.blue : Colors.blueGrey,),
        ),
        BottomNavigationBarItem(
          title: Text(""),
          icon: new Icon (Icons.search, color: selectedPageIndex == 1? Colors.blue : Colors.blueGrey,),
        ),
        BottomNavigationBarItem(
            title: Text(""),
            icon: new Icon (Icons.map, color: selectedPageIndex == 2? Colors.blue : Colors.blueGrey,)
        ),
        BottomNavigationBarItem(
          title: Text(""),
          icon: new Icon (Icons.accessibility, color: selectedPageIndex == 3? Colors.blue : Colors.blueGrey,),
        ),
      ], onTap: (index) {
        setState(() {
          selectedPageIndex = index;
        });
      },
        currentIndex: selectedPageIndex,),
    );
  }*/



