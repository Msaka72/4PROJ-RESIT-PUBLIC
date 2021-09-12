import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  // Variable liées aux markers
  List<Marker> myMarkerList = [];
  final myTitleController = TextEditingController();
  final mySnippetController = TextEditingController();
  static final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(50.633333, 3.066667),
    zoom: 11.5,
  );

  // Variable liées à la génération de la Map Google
  late GoogleMapController _googleMapController;

  // Variable liées à la BDD Firestorm
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Stream<QuerySnapshot> _mapMarkersStream =
      FirebaseFirestore.instance.collection("Map_Markers").snapshots();

  void _onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _mapMarkersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        snapshot.data!.docs.forEach(
          (element) {
            var data = element.data() as Map<String, dynamic>;
            myMarkerList.add(
              Marker(
                markerId: MarkerId(data["markerId"]),
                position: LatLng(
                  data["position"].latitude,
                  data["position"].longitude,
                ),
                infoWindow: InfoWindow(
                  title: data["title"],
                  snippet: data["snippet"],
                ),
                icon: BitmapDescriptor.defaultMarker,
              ),
            );
          },
        );
        
        return new Scaffold(
          body: Stack(
            children: <Widget>[
              GoogleMap(
                onMapCreated: _onMapCreated,
                mapType: MapType.normal,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                initialCameraPosition: _initialCameraPosition,
                markers: Set.from(myMarkerList),
                onLongPress: _tripEditModalBottomSheet,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.black,
            onPressed: () => _googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(_initialCameraPosition),
            ),
            child: const Icon(Icons.center_focus_strong),
          ),
        );
      },
    );
  }

  // Methode afficant une popup aprés avoir "selectionner"
  // un point sur la carte et ajoutant le point a la DB
  void _tripEditModalBottomSheet(tappedPoint) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: new InputDecoration(labelText: "Title"),
                  controller: myTitleController,
                ),
                TextField(
                  decoration: new InputDecoration(labelText: "Description"),
                  controller: mySnippetController,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    markerSet(tappedPoint);
                  },
                  child: Text("Valider"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Methode ajoutant le point remplit dans _tripEditModalBottomSheet à la BDD
  Future<void> markerSet(LatLng tappedPoint) async {
    await FirebaseFirestore.instance
        .collection("Map_Markers")
        .doc(myTitleController.text)
        .set(
      {
        "markerId": tappedPoint.toString(),
        "position": GeoPoint(
          tappedPoint.latitude,
          tappedPoint.longitude,
        ),
        "title": myTitleController.text,
        "snippet": mySnippetController.text,
      },
    );
  }
}
