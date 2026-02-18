import 'package:flutter/material.dart';

/// MESSAGE STATUS

enum MessageStatus {
  pending(value: 'PENDING', color: Colors.grey, icon: Icons.schedule),
  sent(value: 'SENT', color: Colors.blueGrey, icon: Icons.send),
  delivered(value: 'DELIVERED', color: Colors.blue, icon: Icons.done_all),
  read(value: 'READ', color: Colors.green, icon: Icons.done_all);

  final String value; // used for backend / server mapping
  final Color color; // for UI display
  final IconData icon; // status icon

  const MessageStatus({
    required this.value,
    required this.color,
    required this.icon,
  });
}

/// MESSAGE TYPE

enum MessageType {
  text(value: 'TEXT', icon: Icons.text_snippet),
  image(value: 'IMAGE', icon: Icons.image),
  video(value: 'VIDEO', icon: Icons.videocam),
  audio(value: 'AUDIO', icon: Icons.audiotrack),
  file(value: 'FILE', icon: Icons.insert_drive_file);

  final String value; // server string value
  final IconData icon; // UI icon

  const MessageType({required this.value, required this.icon});
}

/// CHAT TYPE
enum ChatType {
  private(value: 'PRIVATE', description: '1-on-1 chat'),
  group(value: 'GROUP', description: 'Group chat'),
  broadcast(value: 'BROADCAST', description: 'Broadcast message');

  final String value; // server/backend value
  final String description; // human readable

  const ChatType({required this.value, required this.description});

  bool get isGroup => this == ChatType.group;
  bool get isPrivate => this == ChatType.private;
}

/// USER STATUS
enum UserStatus {
  online(value: 'ONLINE', color: Colors.green),
  offline(value: 'OFFLINE', color: Colors.grey),
  typing(value: 'TYPING', color: Colors.blue),
  away(value: 'AWAY', color: Colors.orange);

  final String value; // backend representation
  final Color color; // UI color

  const UserStatus({required this.value, required this.color});

  bool get isActive => this == UserStatus.online || this == UserStatus.typing;
}

/// REACTION TYPE

enum ReactionType {
  like(value: 'LIKE', emoji: '👍'),
  love(value: 'LOVE', emoji: '❤️'),
  laugh(value: 'LAUGH', emoji: '😂'),
  sad(value: 'SAD', emoji: '😢'),
  angry(value: 'ANGRY', emoji: '😡');

  final String value; // server string
  final String emoji; // UI emoji

  const ReactionType({required this.value, required this.emoji});

  bool get isPositive =>
      this == ReactionType.like ||
      this == ReactionType.love ||
      this == ReactionType.laugh;
}

enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  error;

  bool get isLoading => this == AuthStatus.loading;
  bool get isAuthenticated => this == AuthStatus.authenticated;
  bool get isLoggedIn => this == AuthStatus.authenticated;
  bool get isError => this == AuthStatus.error;
  bool get isUnauthenticated => this == AuthStatus.unauthenticated;

  String get displayLabel {
    switch (this) {
      case AuthStatus.initial:
        return 'Initial';
      case AuthStatus.loading:
        return 'Loading...';
      case AuthStatus.authenticated:
        return 'Authenticated';
      case AuthStatus.unauthenticated:
        return 'Login';
      case AuthStatus.error:
        return 'Error';
    }
  }
}

enum AuthFlow { login, register }

enum HeaderAlignment { center, start }

// enum OrderStatus {

//   pending,
//   shipping,
//   delivered,
//   cancel,
//   notGiven
// }

// extension OrderStatusMapper on OrderStatus {
//   String get value =>switch(this){
//    OrderStatus.pending => 'PENDING',
//    OrderStatus.shipping => 'SHIPPING',
//    OrderStatus.delivered => 'DELIVERED',
//    OrderStatus.cancel => 'CANCEL',
//    OrderStatus.notGiven => 'NOT_GIVEN',
//   };

//   static OrderStatus fromApi(String value) {
//     return OrderStatus.values.firstWhere(
//           (e) => e.name.toUpperCase() == value.toUpperCase(),
//       orElse: () => OrderStatus.cancel,
//     );
//   }
// }

// class Order {
//   final String id;
//   final OrderStatus status;

//   Order({required this.id, required this.status});

//   factory Order.fromJson(Map<String, dynamic> json) {
//     return Order(
//       id: json["id"],
//       status: OrderStatusMapper.fromApi(json["orderStatus"]),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {"id": id, "orderStatus": status.value};
//   }
// }

//void main() {
  // print(OrderStatus.shipping.value);
  // final json = {"id": "1", "orderStatus": "PENDING"};
  // print(json);
  //
  // final order = Order.fromJson(json);
  // print(order.toJson());
  //
  // final json2 = {"id": "2", "orderStatus": "delivered"};
  // final order2 = Order.fromJson(json2);
  // print(order2.toJson());
  //
  // final json3 = {"id": "3", "orderStatus": "SOMETHING_WRONG"};
  // final order3 = Order.fromJson(json3);
  // print(order3.toJson());
//}
