import 'package:flutter/material.dart';

class HomeEntity {
  final UserEntity user;
  final AccountEntity account;
  final List<TransactionEntity> transactions;

  HomeEntity({
    required this.user,
    required this.account,
    required this.transactions,
  });
}

class UserEntity {
  final String fullName;
  final String? profileImageUrl;

  UserEntity({required this.fullName, this.profileImageUrl});
}

class AccountEntity {
  final String accountType;
  final double balance;
  final String currency;

  AccountEntity({
    required this.accountType,
    required this.balance,
    this.currency = "NPR",
  });

  String get formattedBalance => "$currency ${balance.toStringAsFixed(2)}";
}

class TransactionEntity {
  final String title;
  final String subtitle;
  final double amount;
  final bool isDebit;
  final IconData icon;
  final Color? iconBackgroundColor;
  final DateTime dateTime;

  TransactionEntity({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.isDebit,
    required this.icon,
    this.iconBackgroundColor,
    required this.dateTime,
  });

  String get formattedAmount => "NPR ${amount.toStringAsFixed(2)}";
}
