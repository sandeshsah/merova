import 'package:flutter/material.dart';
import '../themes/app_colors.dart';

class BalanceCard extends StatelessWidget {
  final String balance;
  final bool isVisible;
  final VoidCallback onVisibilityToggle;
  final String accountType;

  const BalanceCard({
    super.key,
    required this.balance,
    required this.isVisible,
    required this.onVisibilityToggle,
    this.accountType = "Current Account",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF147BA0), Color(0xFF3FBCE6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                accountType,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                icon: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                  size: 22,
                ),
                onPressed: onVisibilityToggle,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "Total Balance",
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            isVisible ? balance : "••••••",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
