// pagina donde se muestra el listado de elementos
import 'package:flutter/material.dart';
import 'package:estructura_1/datos.dart';

class Listado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //title: "Test 4",
        home: new Scaffold(
            appBar: buildAppBar(),
            body: buildListView(),
            bottomNavigationBar: buildBottomNavigationBar()
        )
    );
  }

  ListView buildListView() {

    List<Elemento> _listElem = [];

    _listElem = elemento.where((Elemento item) => item.categoria == "Personajes").toList();

    return ListView.builder(
      itemBuilder: (context, index) => new ElementoSummary(_listElem[index]),
      itemCount: _listElem.length,
    );
  }

  AppBar buildAppBar() {
    return new AppBar(
      title: new Text("Aviles"),
      backgroundColor: const Color.fromRGBO(78, 234, 32, 12.0),
      actions: <Widget>[
        new IconButton(icon: new Icon(Icons.search), onPressed: null),
        new IconButton(icon: new Icon(Icons.accessibility), onPressed: null)
      ],
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return new BottomNavigationBar(items: <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
          icon: new Icon(Icons.map), title: new Text("map")),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.favorite), title: new Text("fav")),
    ]);
  }

}


class ElementoSummary extends StatelessWidget {
  final Elemento elemento;
  final bool horizontal;

  ElementoSummary(this.elemento, {this.horizontal = true});

  ElementoSummary.vertical(this.elemento) : horizontal = false;


  Widget buildCard(String name, String imag, String desc){
    return new Card(
        color: Colors.yellowAccent,
        shape: const RoundedRectangleBorder(borderRadius: const BorderRadius.all(const Radius.circular(44.0))),
        child:  new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //new HomePageBody(),
            new Container(
              color: Colors.purple,
              alignment: Alignment.center,
              padding: EdgeInsets.all(4.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Text(name,style: new TextStyle(fontSize: 23.0, color: Colors.lightGreen),textAlign: TextAlign.center, ),
                ],
              ),
            ),
            new Divider(color: Colors.red,),
            new Container(
              color: Colors.lightGreen,
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(imag),
                  ]

              ),
            ),
            new Container(
              color: Colors.lightBlue,
              child: new Column(
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new IconButton(
                            icon: new Icon(Icons.speaker), onPressed: null),
                        new IconButton(
                            icon: new Icon(Icons.map), onPressed: null),
                        new IconButton(
                            icon: new Icon(Icons.favorite), onPressed: null)
                      ],
                    ),
                  ]
              ),
            ),
            new Container(
                color: Colors.red,
                padding: EdgeInsets.all(10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Text(desc, maxLines: 1,overflow: TextOverflow.fade),
                  ],
                )
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {

    return buildCard(this.elemento.name, this.elemento.image, this.elemento.situacion);

  }
}