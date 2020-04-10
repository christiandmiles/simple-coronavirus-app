import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// cache standard places
const places = {
  'New York': LatLng(40.7127753, -74.0059728),
  'New Jersey': LatLng(40.0583238, -74.4056612),
  'Michigan': LatLng(44.3148443, -85.60236429999999),
  'California': LatLng(36.778261, -119.41793240000001),
  'Louisiana': LatLng(30.9842977, -91.96233269999999),
  'Massachusetts': LatLng(42.4072107, -71.3824374),
  'Pennsylvania': LatLng(41.203321599999995, -77.1945247),
  'Florida': LatLng(27.6648274, -81.5157535),
  'Illinois': LatLng(40.6331249, -89.3985283),
  'Georgia': LatLng(32.1656221, -82.9000751),
  'Texas': LatLng(31.968598800000002, -99.9018131),
  'Washington': LatLng(47.7510741, -120.7401385),
  'Connecticut': LatLng(41.6032207, -73.087749),
  'Indiana': LatLng(40.2671941, -86.1349019),
  'Colorado': LatLng(39.5500507, -105.78206739999999),
  'Maryland': LatLng(39.0457549, -76.64127119999999),
  'Ohio': LatLng(40.417287099999996, -82.90712300000001),
  'Tennessee': LatLng(35.517491299999996, -86.5804473),
  'Virginia': LatLng(37.4315734, -78.6568942),
  'North Carolina': LatLng(35.7595731, -79.01929969999999),
  'Missouri': LatLng(37.9642529, -91.8318334),
  'Wisconsin': LatLng(43.7844397, -88.7878678),
  'Arizona': LatLng(34.0489281, -111.0937311),
  'South Carolina': LatLng(33.836081, -81.1637245),
  'Alabama': LatLng(32.3182314, -86.902298),
  'Nevada': LatLng(38.8026097, -116.41938899999998),
  'Mississippi': LatLng(32.354667899999995, -89.3985283),
  'Utah': LatLng(39.3209801, -111.0937311),
  'Oklahoma': LatLng(35.007751899999995, -97.092877),
  'Rhode Island': LatLng(41.5800945, -71.4774291),
  'District Of Columbia': LatLng(38.9071923, -77.0368707),
  'Kentucky': LatLng(37.8393332, -84.2700179),
  'Oregon': LatLng(43.8041334, -120.5542012),
  'Idaho': LatLng(44.0682019, -114.7420408),
  'Minnesota': LatLng(46.729552999999996, -94.6858998),
  'Iowa': LatLng(41.8780025, -93.097702),
  'Delaware': LatLng(38.9108325, -75.52766989999999),
  'Arkansas': LatLng(35.201049999999995, -91.8318334),
  'Kansas': LatLng(39.011902, -98.4842465),
  'New Mexico': LatLng(34.5199402, -105.8700901),
  'New Hampshire': LatLng(43.193851599999995, -71.5723953),
  'Vermont': LatLng(44.558802799999995, -72.57784149999999),
  'Maine': LatLng(45.253783, -69.4454689),
  'Nebraska': LatLng(41.492537399999996, -99.9018131),
  'West Virginia': LatLng(38.5976262, -80.4549026),
  'Hawaii': LatLng(19.8967662, -155.5827818),
  'South Dakota': LatLng(43.9695148, -99.9018131),
  'Montana': LatLng(46.879682200000005, -110.3625658),
  'North Dakota': LatLng(47.551492599999996, -101.0020119),
  'Wyoming': LatLng(43.0759678, -107.29028389999999),
  'Alaska': LatLng(64.2008413, -149.49367329999998),
  'Guam': LatLng(13.444303999999999, 144.79373099999998),
  'Northern Mariana Islands': LatLng(15.2020507, 145.7176095),
  'Puerto Rico': LatLng(18.0117807, -66.6134129),
  'United States Virgin Islands': LatLng(18.335765, -64.896335),
  'Wuhan Repatriated': LatLng(30.592848999999998, 114.305539),
  'Diamond Princess Cruise': LatLng(26.096996299999997, -80.1208724),
  'Us Military': LatLng(38.9354, -76.992047)
};


Future<LatLng> geocode(String address) async {
  if(places.containsKey(address)) {
    return places[address];
  }
  var locations = await Geolocator().placemarkFromAddress('$address, USA');
  var first = locations.first;
  print("'$address': LatLng(${first.position.latitude}, ${first.position.longitude})");
  return LatLng(first.position.latitude, first.position.longitude);
}