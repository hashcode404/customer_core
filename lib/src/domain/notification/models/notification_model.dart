import 'dart:convert';

class NotificationModel {
  final String? title;
  final String? body;
  final DateTime? dateTime;
  final String? orderID;
  final String? customerOrderID;

  NotificationModel({
    this.title,
    this.body,
    this.dateTime,
    this.orderID,
    this.customerOrderID,
  });

  NotificationModel copyWith({
    String? title,
    String? body,
    DateTime? dateTime,
    String? orderID,
    String? customerOrderID,
  }) {
    return NotificationModel(
      title: title ?? this.title,
      body: body ?? this.body,
      dateTime: dateTime ?? this.dateTime,
      orderID: orderID ?? this.orderID,
      customerOrderID: customerOrderID ?? this.customerOrderID,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
      'dateTime': dateTime?.millisecondsSinceEpoch,
      'orderID': orderID,
      'customerOrderID': customerOrderID,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'],
      body: map['body'],
      dateTime: map['dateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateTime'])
          : null,
      orderID: map['orderID'],
      customerOrderID: map['customerOrderID'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NotificationModel(title: $title, body: $body, dateTime: $dateTime, orderID: $orderID, customerOrderID: $customerOrderID)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NotificationModel &&
        other.title == title &&
        other.body == body &&
        other.dateTime == dateTime &&
        other.orderID == orderID &&
        other.customerOrderID == customerOrderID;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        body.hashCode ^
        dateTime.hashCode ^
        orderID.hashCode ^
        customerOrderID.hashCode;
  }
}
