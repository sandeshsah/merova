import 'package:flutter/material.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import '../bloc/payment_state.dart';

class PaymentOverview extends StatelessWidget {
  final PaymentState state;
  final Widget actionButton;

  const PaymentOverview({
    super.key,
    required this.state,
    required this.actionButton,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: Dimensions.paddingDefault,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Transfer Overview",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildInfoCard(),
          const SizedBox(height: 32),
          _buildDetailRow("Service Provider", state.selectedService?.name ?? ""),
          _buildDetailRow("Account Number", state.accountIdentifier ?? ""),
          _buildDetailRow("Amount", "NPR ${state.amount?.toStringAsFixed(2) ?? "0.00"}"),
          _buildDetailRow("Charge", "NPR 0.00"),
          const Divider(height: 32),
          _buildDetailRow("Total", "NPR ${state.amount?.toStringAsFixed(2) ?? "0.00"}", isTotal: true),
          const SizedBox(height: 40),
          actionButton,
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primary.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.receipt_long, color: Colors.white, size: 40),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Payment",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                Text(
                  "NPR ${state.amount?.toStringAsFixed(2) ?? "0.00"}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isTotal ? AppColors.textPrimary : AppColors.textSecondary,
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: isTotal ? 18 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
