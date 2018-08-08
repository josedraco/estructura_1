// pagina donde se muestra el listado de elementos
import 'package:flutter/material.dart';
import 'package:estructura_1/datos.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Listado extends StatefulWidget {
  final String pulsado;
  Listado(this.pulsado);

  @override
  _ListadoState createState() => _ListadoState(pulsado);
}

class _ListadoState extends State<Listado> {
  final String pulsado;
  _ListadoState(this.pulsado);



  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //title: "Test 4",
        home: new Scaffold(
            appBar: buildAppBar(context),
            body: buildListView(this.pulsado),
            bottomNavigationBar: buildBottomNavigationBar()
        )
    );
  }

  ListView buildListView(String pulsado) {

    List<Elemento> _listElem = [];

    _listElem = elemento.where((Elemento item) => item.categoria == pulsado).toList();

    return ListView.builder(
      itemBuilder: (context, index) => buildCard(_listElem[index].name, _listElem[index].image,_listElem[index].description, _listElem[index].id, index),
      itemCount: _listElem.length,
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      title: new Text("Aviles"),
      backgroundColor: const Color.fromRGBO(78, 234, 32, 12.0),
      leading: new IconButton(icon: new Icon(Icons.arrow_back), onPressed: () => Navigator.of(context).pop()),
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

  Widget buildCard(String name, String imag, String desc, String id, int index){

    int idInt;
    idInt = int.parse(id)-1;

    return new Card(
      //color: Colors.yellowAccent,
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
              //color: Colors.lightBlue,
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
                      icon: elemento[idInt].favorito ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                      color: elemento[idInt].favorito ? Colors.red : null,
                      onPressed: () {setState(() {
                        elemento[idInt].favorito = ! elemento[idInt].favorito;
                        toggleFavoriteElemento(elemento[idInt]);
                        //print(elemento[i].favorito);
                      });
                      },
                      ),
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


}



void saveFavorites() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList("favoritos",favoritos);
}

void toggleFavoriteElemento(Elemento elemento) {
  if (favoritos.contains(elemento.id))
    favoritos.remove(elemento.id);
  else
    favoritos.add(elemento.id);

  saveFavorites();
}
