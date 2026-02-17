import 'package:flutter/material.dart';
import '../model/home_model.dart';
import 'home_datasource.dart';

class HomeMockDataSource implements HomeDataSource {
  @override
  Future<HomeModel> getHomeData() async {
    await Future.delayed(const Duration(milliseconds: 800));

    return HomeModel(
      user: UserModel(fullName: "John Doe"),
      account: AccountModel(
        accountType: "Current Account",
        balance: 125450.00,
        currency: "NPR",
      ),
      transactions: [
        TransactionModel(
          title: "Shopping",
          subtitle: "Amazon Store",
          amount: 5240.00,
          isDebit: true,
          icon: Icons.shopping_bag,
          iconBackgroundColor: const Color(0xfff44336), // error
          dateTime: DateTime.now().subtract(const Duration(hours: 2)),
        ),
        TransactionModel(
          title: "Salary Received",
          subtitle: "Monthly Salary",
          amount: 85000.00,
          isDebit: false,
          icon: Icons.account_balance_wallet,
          iconBackgroundColor: const Color(0xff4caf50), // success
          dateTime: DateTime.now().subtract(const Duration(days: 1)),
        ),
        TransactionModel(
          title: "Restaurant",
          subtitle: "Cafe Delight",
          amount: 1850.00,
          isDebit: true,
          icon: Icons.restaurant,
          iconBackgroundColor: const Color(0xFFFF9800),
          dateTime: DateTime.now().subtract(const Duration(days: 2)),
        ),
        TransactionModel(
          title: "Fuel",
          subtitle: "Petrol Pump",
          amount: 3200.00,
          isDebit: true,
          icon: Icons.local_gas_station,
          iconBackgroundColor: const Color(0xFF9C27B0),
          dateTime: DateTime.now().subtract(const Duration(days: 3)),
        ),
        TransactionModel(
          title: "Mobile Recharge",
          subtitle: "Ncell Prepaid",
          amount: 500.00,
          isDebit: true,
          icon: Icons.phone_android,
          iconBackgroundColor: const Color(0xFF2196F3),
          dateTime: DateTime.now().subtract(const Duration(days: 4)),
        ),
      ],
    );
  }

  @override
  Future<List<TransactionModel>> getRecentTransactions() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final homeData = await getHomeData();
    return homeData.transactions.cast<TransactionModel>();
  }
}
