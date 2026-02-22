import 'package:flutter/material.dart';
import 'package:merova/src/features/home/domain/entity/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({
    required super.user,
    required super.account,
    required super.transactions,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      user: UserModel.fromJson(json['user']),
      account: AccountModel.fromJson(json['account']),
      transactions: (json['transactions'] as List)
          .map((i) => TransactionModel.fromJson(i))
          .toList(),
    );
  }
}

class UserModel extends UserEntity {
  UserModel({required super.fullName, super.profileImageUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'] ?? '',
      profileImageUrl: json['profileImageUrl'],
    );
  }
}

class AccountModel extends AccountEntity {
  AccountModel({
    required super.accountType,
    required super.balance,
    super.currency,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      accountType: json['accountType'] ?? '',
      balance: (json['balance'] ?? 0.0).toDouble(),
      currency: json['currency'] ?? 'NPR',
    );
  }
}

class TransactionModel extends TransactionEntity {
  TransactionModel({
    required super.title,
    required super.subtitle,
    required super.amount,
    required super.isDebit,
    required super.icon,
    super.iconBackgroundColor,
    required super.dateTime,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      amount: (json['amount'] ?? 0.0).toDouble(),
      isDebit: json['isDebit'] ?? true,
      icon: _getIconData(json['icon']),
      iconBackgroundColor: json['iconBackgroundColor'] != null
          ? Color(int.parse(json['iconBackgroundColor']))
          : null,
      dateTime: DateTime.parse(
        json['dateTime'] ?? DateTime.now().toIso8601String(),
      ),
    );
  }

  static IconData _getIconData(String? iconName) {
    switch (iconName) {
      case 'shopping_bag':
        return Icons.shopping_bag;
      case 'account_balance_wallet':
        return Icons.account_balance_wallet;
      case 'restaurant':
        return Icons.restaurant;
      case 'local_gas_station':
        return Icons.local_gas_station;
      case 'phone_android':
        return Icons.phone_android;
      case 'send':
        return Icons.send;
      case 'receipt_long':
        return Icons.receipt_long;
      default:
        return Icons.help_outline;
    }
  }
}
