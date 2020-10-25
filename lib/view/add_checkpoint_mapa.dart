import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:tela_inicial/controller/controller.dart';
import 'package:tela_inicial/model/model.dart';



class add_checkpoint_mapa extends StatefulWidget {
  @override
  add_checkpoint_mapa_estado createState() => add_checkpoint_mapa_estado();

  Widget build(BuildContext context) => Scaffold();
}

class add_checkpoint_mapa_estado extends State<add_checkpoint_mapa> {
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

    print(_resultAddress);
    print("----------------");
    print(_markerLocation);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: estilo.cor,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 360),

            child: Row(children: <Widget>[
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    controller_add_checkpoint_mapa.voltar(context);
                  },
                ),
              ),
            ]),
          ),
        ],
      ),





      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder<LocationData>(
                future: _getUserLocation,
                builder: (context, snapshot) {
                  switch (snapshot.hasData) {
                    case true:
                      return MyMap(
                        markerLocation: _markerLocation,
                        userLocation: _userLocation,
                          onTap: (location) async {
                          setState(() {
                            botao = 1;
                            _markerLocation = location;

                            if (_markerLocation != null) {
                              getSetAddress(Coordinates(
                                  _markerLocation.latitude,
                                  _markerLocation.longitude));
                            }
                            reassemble();

                          });
                        },
                      );
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
        decoration: new BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 15.0,
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
          width: MediaQuery.of(context).size.width * 0.9,
          height: 50.0,
          child: RaisedButton(
            onPressed: () {
              if(controller_add_checkpoint_mapa.boolCheckpointMapa(_markerLocation,_resultAddress)){
                controller_add_checkpoint_mapa.setCheckpointMapa(_markerLocation,_resultAddress);
                controller_add_checkpoint_mapa.proxima(context);
              }
            },
            child: const Text(
              'Confirmar local de ocorrência',
              style: TextStyle(fontSize: 19, color: Colors.white),
            ),
            color: botao != 0 ? estilo.cor : Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
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
      markers: widget.markerLocation != null
          ? [
        Marker(
            markerId: MarkerId(""),
            position: widget.markerLocation),
      ].toSet()
          : null,
      onTap: widget.onTap,
    );
  }
}


