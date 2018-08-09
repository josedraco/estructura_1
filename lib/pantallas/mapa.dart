// pagina del mapa a mostrar

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:maps_demo/venue_details.dart';
//import 'package:maps_demo/location.dart';
import 'package:estructura_1/datos.dart';
import 'package:estructura_1/lugares.dart';
import 'package:estructura_1/pantallas/detalle.dart';


class Venues extends StatelessWidget {

  final List<Elemento> elemMapa;
  Venues(this.elemMapa);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: const Text("Lugares Aviles")),
      body: GoogleMaps(elemMapa),
    );
  }
}

class GoogleMaps extends StatefulWidget {
  //GoogleMaps({Key key, this.elemMapa}) : super(key: key);
  final List<Elemento> elemMapa;
  GoogleMaps(this.elemMapa);

  @override
  _GoogleMaps createState() => new _GoogleMaps(elemMapa);
}

class _GoogleMaps extends State<GoogleMaps> {

  final List<Elemento> elemMapa;
  _GoogleMaps(this.elemMapa);

  CameraPosition _position;
  GoogleMapOptions _options;
  bool _isMoving;
  GoogleMapOverlayController mapOverlayController;

  // List<Lugar> locations = List<Lugar>();

  @override
  void didUpdateWidget(GoogleMaps oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    mapOverlayController.overlayController.deactivateOverlay();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void initState() {

    //locations.addAll(Lugar);

    super.initState();
  }

  void _onMapChanged() {
    if (mounted) {
      setState(() {
        _extractMapInfo();
      });
    }
  }

  void _extractMapInfo() {
    _options = mapOverlayController.mapController.options;
    _position = mapOverlayController.mapController.cameraPosition;
    _isMoving = mapOverlayController.mapController.isCameraMoving;
  }

  void buildMap() async {
    if (mapOverlayController != null) return;

    var mq = MediaQuery.of(context);
    // add delay so overlay is positioned correctly
    await new Future<Null>.delayed(new Duration(milliseconds: 20));

    //print (double.parse(locations[0].latitud));

    mapOverlayController = GoogleMapOverlayController.fromSize(
      width: mq.size.width,
      height: mq.size.height,
      options: GoogleMapOptions(
        cameraPosition: CameraPosition(
          target: LatLng(43.556369, -5.921637),
          zoom: 15.0,
        ),
        trackCameraPosition: true,
      ),
    );
    mapOverlayController.mapController.addListener(_onMapChanged);

    //TODO Recorre el bucle de elementos
    elemMapa.forEach((loc) {
      if (loc.latitud == null) return;

      mapOverlayController.mapController.addMarker(MarkerOptions(
          zIndex: double.parse(loc.id),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen), //para poner el color a las marcas
          position: LatLng((loc.latitud), (loc.longitud)),
          infoWindowText:
          InfoWindowText(loc.name, loc.situacion)));
    });

    mapOverlayController.mapController.onInfoWindowTapped.add((Marker marker) {
      mapOverlayController.overlayController.deactivateOverlay();
      var index = marker.options.zIndex.toInt() - 1;
      //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => VenueDetails(locations[index], _notifyPop)));
    });

    mapOverlayController.overlayController.activateOverlay();
    setState(() {});
  }

  Widget renderMap() {
    if (mapOverlayController == null) {
      return Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150.0,
                  width: 150.0,
                  child: new CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    value: null,
                    strokeWidth: 7.0,
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  child: new Center(
                    child: new Text("Cargando.. por favor, espere...", ),
                  ),
                ),
              ]));
    } else {
      return GoogleMapOverlay(controller: mapOverlayController);
    }
  }

  @override
  Widget build(BuildContext context) {
    buildMap();
    return renderMap();
  }

  void _notifyPop(bool success) {
    mapOverlayController.overlayController.activateOverlay();
  }
}
