// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:async';

import 'package:alarmed/domain/entities/pharmacy.dart';
import 'package:alarmed/services/location_service.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:alarmed/ui/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage>
    with AutomaticKeepAliveClientMixin<LocationPage> {
  final Completer<GoogleMapController> _controller = Completer();
  Marker marker = Marker(markerId: const MarkerId('marker'));

  LocationService locationService = LocationService();
  String? pharmaName;
  String? pharmaAddress;
  String? pharmaPhone;
  String? pharmaOpen;

  bool keepAlive = false;

  static final CameraPosition _kLake = CameraPosition(
      target: LatLng(11.022271431059005, -74.81760770071617), zoom: 15);

  @override
  void initState() {
    super.initState();
    waitForLocationUpdate();
  }

  Future waitForLocationUpdate() async {
    keepAlive = true;
    updateKeepAlive();
    while (keepAlive) {
      await Future.delayed(const Duration(minutes: 4), () {
        if (locationService.isCurrentLocationFarDistance()) {
          print(locationService.isCurrentLocationFarDistance());
          setState(() {
            keepAlive = false;
            updateKeepAlive();
          });
          return;
        }
      });
    }
  }

  @override
  bool get wantKeepAlive => keepAlive;

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    super.build(context);
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
                    markers: {marker},
                    myLocationEnabled: true,
                    initialCameraPosition: _kLake,
                    onMapCreated: (GoogleMapController controller) async {
                      Position location =
                          await locationService.getCurrentLocation();
                      _controller.complete(controller);

                      controller.animateCamera(CameraUpdate.newCameraPosition(
                          CameraPosition(
                              target:
                                  LatLng(location.latitude, location.longitude),
                              zoom: 15)));
                      List<Pharmacy> pharmacies =
                          await locationService.getPharmacies();

                      if (!pharmacies.isEmpty) {
                        controller.animateCamera(CameraUpdate.newCameraPosition(
                            CameraPosition(
                                target: LatLng(pharmacies[0].latitude,
                                    pharmacies[0].longitude),
                                zoom: 17)));

                        setState(() {
                          marker = Marker(
                              markerId: MarkerId('marker'),
                              position: LatLng(pharmacies[0].latitude,
                                  pharmacies[0].longitude),
                              infoWindow:
                                  InfoWindow(title: pharmacies[0].name));
                        });
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Obx(
                    () => PageView.builder(
                      controller: PageController(viewportFraction: 1.1),
                      itemCount: userController
                              .loggedUserNearbyPharmacies.isEmpty
                          ? 1
                          : userController.loggedUserNearbyPharmacies.length,
                      onPageChanged: (value) {
                        changeCameraToPoint(
                            userController
                                .loggedUserNearbyPharmacies[value].latitude,
                            userController
                                .loggedUserNearbyPharmacies[value].longitude,
                            userController
                                .loggedUserNearbyPharmacies[value].name);
                      },
                      itemBuilder: (context, index) {
                        return userController.loggedUserNearbyPharmacies.isEmpty
                            ? Center(
                                child: CircularProgressIndicator(
                                strokeWidth: 6,
                                color: Colors.white,
                              ))
                            : FractionallySizedBox(
                                widthFactor: 1 / 1.1,
                                child: Column(children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 18),
                                    child: FittedBox(
                                      child: Text(
                                        userController
                                                .loggedUserNearbyPharmacies
                                                .isEmpty
                                            ? 'No hay farmacias cercanas'
                                            : userController
                                                .loggedUserNearbyPharmacies[
                                                    index]
                                                .name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28,
                                            color: Constant.title),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.schedule,
                                          color: Constant.title,
                                          size: 40,
                                        ),
                                        Expanded(
                                          child: FittedBox(
                                            child: Text(handleOpenClose(index),
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Constant.title)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: Constant.title,
                                          size: 40,
                                        ),
                                        Expanded(
                                          child: FittedBox(
                                            child: Text(
                                                userController
                                                        .loggedUserNearbyPharmacies
                                                        .isEmpty
                                                    ? 'No hay farmacias cercanas'
                                                    : userController
                                                        .loggedUserNearbyPharmacies[
                                                            index]
                                                        .address,
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Constant.title)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.phone_outlined,
                                          color: Constant.title,
                                          size: 40,
                                        ),
                                        Expanded(
                                          child: FittedBox(
                                            child: Text(
                                                userController
                                                        .loggedUserNearbyPharmacies
                                                        .isEmpty
                                                    ? 'No hay farmacias cercanas'
                                                    : userController
                                                        .loggedUserNearbyPharmacies[
                                                            index]
                                                        .phoneNo,
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Constant.title)),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                              );
                      },
                    ),
                  ),
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

  void changeCameraToPoint(latitude, longitude, name) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(latitude, longitude), zoom: 17)));

    setState(() {
      marker = Marker(
          markerId: MarkerId('marker'),
          position: LatLng(latitude, longitude),
          infoWindow: InfoWindow(title: name));
    });
  }

  String handleOpenClose(index) {
    UserController userController = Get.find();
    bool? pharmaOpen = userController.loggedUserNearbyPharmacies.isEmpty
        ? null
        : userController.loggedUserNearbyPharmacies[index].isOpen;

    if (pharmaOpen == null) {
      return 'Horario no disponible';
    } else if (pharmaOpen) {
      return 'Abierta';
    } else {
      return 'Cerrada';
    }
  }
}
