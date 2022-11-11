// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:async';

import 'package:alarmed/domain/entities/pharmacy.dart';
import 'package:alarmed/services/location_service.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Completer<GoogleMapController> _controller = Completer();

  LocationService locationService = LocationService();
  String? pharmaName;
  String? pharmaAddress;
  String? pharmaPhone;
  String? pharmaOpen;

  static final CameraPosition _kLake = CameraPosition(
      target: LatLng(11.022271431059005, -74.81760770071617), zoom: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('LocationScaffold'),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text('Farmacia',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Constant.title)),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width: 400,
                  decoration: BoxDecoration(
                      color: Constant.secondCont,
                      borderRadius: BorderRadius.circular(20)),
                  child: GoogleMap(
                    initialCameraPosition: _kLake,
                    onMapCreated: (GoogleMapController controller) async {
                      Position location =
                          await locationService.getCurrentLocation();
                      _controller.complete(controller);

                      controller.animateCamera(CameraUpdate.newCameraPosition(
                          CameraPosition(
                              target:
                                  LatLng(location.latitude, location.longitude),
                              zoom: 14)));
                      List<Pharmacy> pharmacies =
                          await locationService.getPharmacies();
                      setState(() {
                        pharmaPhone = pharmacies[0].phoneNo;
                        pharmaAddress = pharmacies[0].address;
                        pharmaOpen = pharmacies[0].isOpen.toString();
                        pharmaName = pharmacies[0].name;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 18),
                      child: Text(
                        pharmaName ?? 'Farmacia mis cositas',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Constant.title),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text('Abierto?',
                                style: TextStyle(
                                    fontSize: 22, color: Constant.title)),
                          ),
                          Expanded(
                            child: FittedBox(
                              child: Text(pharmaOpen ?? 'N/A',
                                  style: TextStyle(
                                      fontSize: 22, color: Constant.title)),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text('Dirección',
                                style: TextStyle(
                                    fontSize: 22, color: Constant.title)),
                          ),
                          Expanded(
                            child: FittedBox(
                              child: Text(pharmaAddress ?? 'N/A',
                                  style: TextStyle(
                                      fontSize: 22, color: Constant.title)),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text('Teléfono',
                                style: TextStyle(
                                    fontSize: 22, color: Constant.title)),
                          ),
                          Expanded(
                            child: FittedBox(
                              child: Text(pharmaPhone ?? 'N/A',
                                  style: TextStyle(
                                      fontSize: 22, color: Constant.title)),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                  decoration: BoxDecoration(
                      color: Constant.secondCont,
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
