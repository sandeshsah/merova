
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/themes/dimensions.dart';

import 'padding_provider_widget.dart';

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
      clipBehavior: Clip.none,
      children: [
        // ClipPath(
        //   clipper: BottomNavClipper(),
        //child:
         Container(
          height: 70.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: AppColors.boxShadow,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Padding(padding: Dimensions.paddingDefault,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex == 2 ? 0 : currentIndex,
            onTap: (index) {
              if (index == 2) return; // middle scanner tapped separately
              onIndexChanged(index);
            },
            backgroundColor: AppColors.transparent,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.payments_rounded),
                label: 'Payment',
              ),
              BottomNavigationBarItem(
                icon: SizedBox.shrink(),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_outlined),
                label: 'Fund Transfer',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.navButton,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            showUnselectedLabels: true,
          ),
        ),
        ),
        //),

        // Center Scanner Button
        Positioned(
          bottom: 20,
          child: GestureDetector(
            onTap: onScannerTap,
            child: Container(
              height: 60,
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


class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double notchRadius = 20;
    final double centerX = size.width / 2;

    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(centerX - notchRadius * 1.5, 0);

    // Left curve
    path.quadraticBezierTo(
      centerX - notchRadius,
      0,
      centerX - notchRadius,
      notchRadius * 0.7,
    );

    // Bottom curve
    path.arcToPoint(
      Offset(centerX + notchRadius, notchRadius * 0.7),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );

    // Right curve
    path.quadraticBezierTo(
      centerX + notchRadius,
      0,
      centerX + notchRadius * 0.7,
      0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

