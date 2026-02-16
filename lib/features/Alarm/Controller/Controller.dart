import 'package:get/get.dart';

import '../../../Helper/NotificationService.dart';
import '../Model/Model.dart';


class NotificationController extends GetxController {
  var notifications = <MyNotification>[].obs;

  void addNotification(MyNotification notification) {
    notifications.add(notification);
    if (notification.isActive) {
      NotificationService.scheduleNotification(
        id: notification.id,
        title: notification.title,
        body: notification.body,
        dateTime: notification.dateTime,
      );
    }
  }

  void toggleNotification(MyNotification notification, bool value) {
    notification.isActive = value;
    notifications.refresh();

    if (value) {
      NotificationService.scheduleNotification(
        id: notification.id,
        title: notification.title,
        body: notification.body,
        dateTime: notification.dateTime,
      );
    } else {
      NotificationService.cancelNotification(notification.id);
    }
  }

  void removeNotification(MyNotification notification) {
    notifications.remove(notification);
    NotificationService.cancelNotification(notification.id);
  }
}
