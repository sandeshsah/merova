import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:merova/src/core/enums/app_enum.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/widget/header_positioned.dart';

@RoutePage()
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const HeaderPositioned(
            title: "Notifications",
            alignment: HeaderAlignment.center,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildNotificationToggle("Push Notifications", true),
                _buildNotificationToggle("Email Notifications", false),
                _buildNotificationToggle("SMS Notifications", true),
                _buildNotificationToggle("Promotional Offers", false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationToggle(String title, bool initialValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SwitchListTile(
        title: Text(title),
        value: initialValue,
        onChanged: (bool value) {},
        activeColor: AppColors.primary,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
