import 'package:customer_core/src/domain/notification/models/notification_model.dart';

abstract class IUserSharedPrefsRepo {
  Future<bool> saveNotification(NotificationModel userData);

  Future<bool> clearNotification();

  Future<List<NotificationModel>> getNotification();
}
