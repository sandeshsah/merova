import 'package:flutter/material.dart';
import 'package:merova/src/core/enums/app_enum.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/widget/header_positioned.dart';

class DeviceManagementPage extends StatelessWidget {
  const DeviceManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const HeaderPositioned(
            title: "Device Management",
            alignment: HeaderAlignment.center,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildDeviceItem("Current Device", "iPhone 15 Pro", true),
                _buildDeviceItem("Other Device", "Samsung Galaxy S23", false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceItem(String label, String deviceName, bool isCurrent) {
    return Card(
      elevation: 0,
      color: Colors.grey.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          Icons.smartphone_rounded,
          color: isCurrent ? AppColors.primary : Colors.grey,
        ),
        title: Text(deviceName),
        subtitle: Text(label),
        trailing: isCurrent
            ? const Chip(
                label: Text(
                  "Active",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                backgroundColor: Colors.green,
              )
            : TextButton(
                onPressed: () {},
                child: const Text(
                  "Remove",
                  style: TextStyle(color: Colors.red),
                ),
              ),
      ),
    );
  }
}
