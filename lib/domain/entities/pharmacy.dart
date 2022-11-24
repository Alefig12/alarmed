class Pharmacy {
  bool? isOpen;
  String name;
  String address;
  String phoneNo;
  double latitude;
  double longitude;

  Pharmacy(
    this.isOpen,
    this.name,
    this.address,
    this.phoneNo,
    this.latitude,
    this.longitude,
  );

  Pharmacy.fromJson(Map<String, dynamic> json)
      : isOpen = json['opening_hours']?['open_now'],
        name = json['name'] ?? 'N/A',
        address = json['vicinity'] ?? 'No disponible',
        phoneNo = json['formatted_phone_number'] ?? 'No disponible',
        latitude = json['geometry']['location']['lat'],
        longitude = json['geometry']['location']['lng'];
}
