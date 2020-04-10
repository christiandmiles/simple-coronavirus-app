import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'NavDrawer.dart';
import 'StateInfo.dart';
import '../services/geocode.dart';
import '../services/novel-covid.dart';

class Map extends StatefulWidget {
  @override
  MapState createState() => MapState();
}

class MapState extends State<Map> {
  Future<Set<Marker>> _getMarkers() async {
    final cases = await NovelCovid().getStates();
    var markers = <Marker>{};
    for (final stateInfo in cases) {
      LatLng position;
      try {
        position = await geocode(stateInfo.state);
      } catch (e) {
        continue;
      }
      final marker = Marker(
          markerId: MarkerId(stateInfo.state),
          position: position,
          icon: BitmapDescriptor.defaultMarkerWithHue(stateInfo.todayCases > 100
              ? BitmapDescriptor.hueRed
              : BitmapDescriptor.hueGreen),
          onTap: () {
            showModalBottomSheet(
              context: context,
              isDismissible: true,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0))),
              builder: (BuildContext context) {
                return Column(children: [
                  Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(stateInfo.state,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20))),
                  StateInfo(stateInfo: stateInfo)
                ]);
              },
            );
          });
      markers.add(marker);
    }
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text('USA Cases Map'),
        ),
        body: FutureBuilder<Set<Marker>>(
            future: _getMarkers(),
            builder:
                (BuildContext context, AsyncSnapshot<Set<Marker>> snapshot) {
              if (!snapshot.hasData || snapshot.hasError) {
                return Center(child: CircularProgressIndicator());
              } else {
                return GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: const LatLng(39.50, -98.35),
                    zoom: 4,
                  ),
                  markers: snapshot.data,
                );
              }
            }));
  }
}
