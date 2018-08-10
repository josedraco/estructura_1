// pagina inicial donde se muestran las categorias a escoger
import 'package:flutter/material.dart';
import 'package:estructura_1/pantallas/listado.dart';
import 'package:estructura_1/pantallas/mapa.dart';
import 'package:estructura_1/datos.dart';

class Categorias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //title: "Test 4",
        home: new Scaffold(
            //appBar: buildAppBar(),
            body: buildGridView(context),
            bottomNavigationBar: buildBottomNavigationBar(context)
        )
    );
  }

  BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
    int _currentIndex = 0;

    return new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            icon: new Icon(Icons.map), title: new Text("map")),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.favorite), title: new Text("fav")),
      ],
      //onTap: (int index) => Navigator.of(context).push(new PageRouteBuilder(pageBuilder: (_, __, ___) => new Venues(elemento))),
      onTap: (int _currentIndex) =>  _navTap(_currentIndex, context),
      currentIndex: _currentIndex,

    );
  }

  void _navTap(int index, BuildContext context) {
   // index != page ? Navigator.of(context).pushReplacementNamed( '/${page.toString()}') : null;

    print(index);

    switch (index){
      case 0: Navigator.of(context).push(new PageRouteBuilder(pageBuilder: (_, __, ___) => new Venues(elemento))); break;
      case 1: Navigator.of(context).push(new PageRouteBuilder(pageBuilder: (_, __, ___) => new Listado('Favoritos')));break;
    }


  }


GestureDetector getStructuredGridCell(BuildContext context, name, image) {
    Color color;

    color = funcioncolor(name);
    return GestureDetector(
      onTap: () {
        // /print("has pulsado sobre $name");
        //Navigator.pushNamed(context, "/listado");
        Navigator.of(context).push(new PageRouteBuilder(pageBuilder: (_, __, ___) => new Listado(name)));
         },
       child: Card(
        elevation: 1.5,
        color: color,
        margin: EdgeInsets.all(20.0),
        // shape: new Border(
        //   top: new BorderSide(width: 16.0, color: Colors.yellow),
        //   bottom: new BorderSide(width: 16.0, color: Colors.lightBlue.shade900),
        shape: const RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
            topLeft: const Radius.circular(16.0),
            topRight: const Radius.circular(16.0),
            bottomLeft: const Radius.circular(16.0),
            bottomRight: const Radius.circular(16.0),
          ),
        ),

        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            new Image(image: new AssetImage('assets/img/iconos/' + image)),
            new Center(
              child: new Text(name),
            )
          ],
        )
      ),
    );
  }

  GridView buildGridView(BuildContext context){

    return new GridView.count(
      primary: true,
      padding: const EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: <Widget>[
        getStructuredGridCell(context, "La ciudad", "facebook.png"),
        getStructuredGridCell(context, "Historico", "twitter.png"),
        getStructuredGridCell(context, "Personajes", "instagram.png"),
        getStructuredGridCell(context, "Iglesias", "linkedin.png"),
        getStructuredGridCell(context, "Curiosidades", "google_plus.png"),
        getStructuredGridCell(context, "Momentos historicos", "Drums.gif"),
      ],
    );
  }

  funcioncolor(name){

    Color _color;
    switch (name) {
      case 'La ciudad':
        _color = Colors.deepOrange;
        break;
      case 'Monumentos':
        _color = Colors.grey;
        break;
      case 'Personajes':
        _color = Colors.blue;
        break;
      case 'Iglesias':
        _color = Colors.green;
        break;
      case 'Curiosidades':
        _color = Colors.pink;
        break;
      default:
        _color = Colors.brown;
        break;
    }

    return _color;
  }

}