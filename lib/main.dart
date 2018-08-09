import 'package:flutter/material.dart';
import 'package:estructura_1/pantallas/categorias.dart';
import 'package:estructura_1/datos.dart';
//import 'package:estructura_1/pantallas/datos.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  GoogleMapController.init();
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
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
        //'/listado': (context) => Listado(),
      },
    );
  }


  @override
  initState() {
    super.initState();
    loadFavorites();
  }

  void loadFavorites() async {
    int i;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      favoritos = prefs.getStringList("favoritos").toList();
      for (var l in favoritos)
      {
        i = int.parse(l)-1;
        setState(() => elemento[i].favorito = !elemento[i].favorito);
      }
    } catch (e) {
      //print("entra error");
      //_favoritos = new Set<String>();
    }
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



