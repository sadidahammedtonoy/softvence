class MyNotification {
  int id;
  String title;
  String body;
  DateTime dateTime;
  bool isActive;

  MyNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.dateTime,
    this.isActive = true,
  });
}
