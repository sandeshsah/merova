import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:merova/src/core/constants/storage_keys.dart';
import 'package:merova/src/core/enums/app_enum.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/themes/app_text_styles.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import 'package:merova/src/core/widget/header_positioned.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  String fullName = "";
  String email = "";
  String phone = "";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    if (mounted) {
      setState(() {
        fullName = prefs.getString(StorageKeys.fullName) ?? "";
        email = prefs.getString(StorageKeys.userEmail) ?? "";
        phone = prefs.getString(StorageKeys.phoneNumber) ?? "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBarBackground(
      title: "Personal Information",
      centerTitle: true,
      body:  Stack(
        children: [
      BodyPositioned(
      child: Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
        child:
          SingleChildScrollView(
            child: Padding(
              padding: Dimensions.paddingLarge,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                   Text("Basic Information", style: AppTextStyles.headline2,),
                  const Divider(),
                  _buildInfoItem("Full Name", fullName.isEmpty ? " " : fullName,),
                  _buildInfoItem("Email Address", email.isEmpty ? " " : email),
                  _buildInfoItem("Phone Number", phone.isEmpty ? " " : phone),
                  const Divider(),
                   Text("Personal Information", style: AppTextStyles.headline2),
                   const Divider(),
                  _buildInfoItem("Date of Birth", "1990-01-01"),
                  _buildInfoItem("Gender", "Male"),
                  _buildInfoItem("Address", "123 Main Street, City"),
                  _buildInfoItem("Citizenship Number", "123456789"),
                  _buildInfoItem("Occupation", "Software Engineer"),
                  _buildInfoItem("Salutation", "Mr."),
                  _buildInfoItem("Nationality", "Nepali"),
                  _buildInfoItem("Marital Status", "Single"),
                  _buildInfoItem("Branch", "Kathmandu"),
                  _buildInfoItem("Father's Name", "-"),
                  _buildInfoItem("Mother's Name", "-"),
                  const Divider(),
                  Text("Account Information", style: AppTextStyles.headline2),
                  const Divider(),
                  _buildInfoItem("Account Open Date", "2023-01-01"),
                  _buildInfoItem("Actual Balance", "NPR 25,450.00"),
                  _buildInfoItem("Balance", "NPR 25,450.00"),
                  _buildInfoItem("Account Type", "Current Account"),
                  _buildInfoItem("Account Status", "Active"),
                  _buildInfoItem("Account Number", "1234567890"),
                  _buildInfoItem("Freeze Reason", "-"),
                  _buildInfoItem("Freeze Status", "Not Frozen"),
                  const Divider(),
                ],
              ),
            ),
          ),

      ),
    )]));
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: Dimensions.paddingMedium,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Left Side (Label)
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.grey,
              ),
            ),
          ),

          /// RIGHT SIDE (Value)
          Expanded(
            flex: 1,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
