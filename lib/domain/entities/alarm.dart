class Alarm {
  int id;
  String pillName;
  List days;
  DateTime startDateTime;
  DateTime? endDateTime;
  int repeat;
  int quantity;
  int dose;
  String? tone;
  double? volume;

  Alarm(
      {required this.id,
      required this.pillName,
      required this.days,
      required this.startDateTime,
      this.endDateTime,
      required this.repeat,
      required this.quantity,
      required this.dose,
      this.tone,
      this.volume});

  String getPillName() {
    return pillName;
  }

  DateTime getDate() {
    return startDateTime;
  }

  int getId() {
    return id;
  }
}
