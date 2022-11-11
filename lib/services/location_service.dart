import 'dart:convert';

import 'package:alarmed/cnts.dart';
import 'package:alarmed/domain/entities/pharmacy.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LocationService {
  String _apiKey = APIKEY.apiKey;

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission locationPermission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error("GPS DESACTIVADO");
    }
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
    }

    if (locationPermission == LocationPermission.denied) {
      return Future.error("PERMISOS DENEGADOS");
    }

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("PERMISO DENEGADO POR SIEMPRE");
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  Future<List<dynamic>> getNearbyPharmacies() async {
    Position location = await getCurrentLocation();
    final String url =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${location.latitude}%2C${location.longitude}&radius=1500&type=pharmacy&key=${_apiKey}";
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var results = json["results"] as List<dynamic>;

    var res = List.generate(results.length, (i) {
      return results[i]["place_id"];
    });
    print(res);
    return res;
  }

  Future<Map<String, dynamic>> getPharmacyInfo(placeid) async {
    final String url =
        "https://maps.googleapis.com/maps/api/place/details/json?fields=vicinity%2Copening_hours/open_now%2Cformatted_phone_number%2Cgeometry/location%2Cname&place_id=${placeid}&key=${_apiKey}";
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var results = json["result"] as Map<String, dynamic>;

    print(results);
    return results;
  }

  Future<List<Pharmacy>> getPharmacies() async {
    List<Pharmacy> pharmacies = [];
    List<dynamic> placesid = await getNearbyPharmacies();

    Map<String, dynamic> info = await getPharmacyInfo(placesid[0]);
    pharmacies.add(Pharmacy(
        info['opening_hours']['open_now'],
        info['name'],
        info['vicinity'],
        info['formatted_phone_number'],
        info['geometry']['location']['lat'].toDouble(),
        info['geometry']['location']['lng'].toDouble()));

    // Map<String, dynamic> info = await getPharmacyInfo();
    // return List.generate(info.length, (i) {
    //   return Pharmacy(
    //       info['opening_hours']['open_now'],
    //       info['vicinity'],
    //       info['formatted_phone_number'],
    //       info['geometry']['location']['lat'],
    //       info['geometry']['location']['lng']);
    // });
    print(pharmacies.length);
    return pharmacies;
  }
}
