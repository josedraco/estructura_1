// pagina inicial donde se muestran las categorias a escoger
import 'package:flutter/material.dart';
import 'package:estructura_1/datos.dart';

class Categorias extends StatelessWidget {
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
    return ListView.builder(
      itemBuilder: (context, index) => new LugarSummary(lugares[index]),
      itemCount: lugares.length,
    );
  }

  AppBar buildAppBar() {
    return new AppBar(
      title: new Text("Aviles industrial.."),
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


class LugarSummary extends StatelessWidget {
  final Lugar lugar;
  final bool horizontal;

  LugarSummary(this.lugar, {this.horizontal = true});

  LugarSummary.vertical(this.lugar) : horizontal = false;


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

    return buildCard(this.lugar.name, this.lugar.image, this.lugar.description);

  }
}