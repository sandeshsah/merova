import 'package:auth/src/core/themes/app_colors.dart';
import 'package:auth/src/core/widget/padding_provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onIndexChanged;
  final VoidCallback onScannerTap;

  const ButtonNavBar({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
    required this.onScannerTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // The actual BottomNavigationBar
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: AppColors.black,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: PaddingProviderWidget(
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex > 2 ? currentIndex - 1 : currentIndex,
            onTap: (index) {
              if (index == 2) return; // middle scanner tapped separately
              onIndexChanged(index > 2 ? index - 1 : index);
            },
            backgroundColor: AppColors.transparent,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shield_outlined),
                label: 'OTP',
              ),
              BottomNavigationBarItem(
                icon: SizedBox.shrink(),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_outlined),
                label: 'Government',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: 'Settings',
              ),
            ],
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.navButton,
            selectedFontSize: 11,
            unselectedFontSize: 11,
            showUnselectedLabels: true,
          ),
        ),),

        // Center Scanner Button
        Positioned(
          bottom: 20,
          child: GestureDetector(
            onTap: onScannerTap,
            child: Container(
              height: 60.w,
              width: 60,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(1, 3),
                  ),
                ],
              ),
              child: Icon(
                Icons.qr_code_scanner,
                color: AppColors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
