import 'package:flutter/material.dart';
import '../themes/app_colors.dart';

class TransactionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;
  final bool isDebit;
  final Color? iconBackgroundColor;

  const TransactionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
    this.isDebit = true,
    this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.boxShadow,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBackgroundColor ?? AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: iconBackgroundColor != null
                  ? Colors.white
                  : AppColors.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "${isDebit ? '-' : '+'} $amount",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDebit ? AppColors.error : AppColors.success,
            ),
          ),
        ],
      ),
    );
  }
}
