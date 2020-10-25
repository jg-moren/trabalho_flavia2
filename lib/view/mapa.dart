import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:tela_inicial/controller/controller.dart';
import 'package:tela_inicial/model/model.dart';



class Mapa extends StatefulWidget {
  @override
  Estado createState() => Estado();

  Widget build(BuildContext context) => Scaffold();
}

class Estado extends State<Mapa> {
  var controlador_endereco = TextEditingController(text: "");
  static int botao = 0;
  Future<LocationData> _getUserLocation;
  LatLng _markerLocation;
  LatLng _userLocation;
  String _resultAddress;

  @override
  void initState() {
    super.initState();
    _getUserLocation = getUserLocation();
  }

  Future<LocationData> getUserLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    final result = await location.getLocation();
    _userLocation = LatLng(result.latitude, result.longitude);
    return result;
  }

  getSetAddress(Coordinates coordinates) async {
    try{
      final addresses =  await Geocoder.local.findAddressesFromCoordinates(coordinates);
      setState(() {
        _resultAddress = addresses.first.addressLine;
      });
    }catch(Expection){
      setState(() {
        _resultAddress = coordinates.toString();
      });
    }
  }
  lerTextField(String endereco) async {

      final addresses =  await Geocoder.local.findAddressesFromQuery(endereco);
      setState(() {
        _resultAddress = addresses.first.featureName;
        _markerLocation = LatLng(addresses.first.coordinates.latitude, addresses.first.coordinates.longitude);

        reassemble();


    });

  }


  @override

  Widget build(BuildContext context) {
    controlador_endereco.text = _resultAddress;


    return Scaffold(


      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder<LocationData>(
                future: _getUserLocation,
                builder: (context, snapshot) {
                  switch (snapshot.hasData) {
                    case true:
                      return MyMap();
                    default:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 75.0,
        decoration: new BoxDecoration(
          color: estilo.cor,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 15.0,
            ),
          ],
        ),

      ),



    );
  }
}

class MyMap extends StatefulWidget {
  final markerLocation, userLocation, onTap;

  const MyMap({Key key, this.markerLocation, this.userLocation, this.onTap})
      : super(key: key);
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(target: widget.userLocation ?? LatLng(-22.9331, -43.1774),),
      minMaxZoomPreference:  MinMaxZoomPreference(13,17),
      myLocationEnabled: true,
      markers:  [
        Marker(
            markerId: MarkerId("0"),
            position: LatLng(-22.9331, -43.1774)),
        Marker(
            markerId: MarkerId("1"),
            position: LatLng(-22.9231, -43.1874)),
        Marker(
            markerId: MarkerId("2"),
            position: LatLng(-22.9531, -43.1874)),
      ].toSet()
    );
  }
}


