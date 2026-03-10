import 'package:flutter/material.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import '../bloc/payment_state.dart';

class PaymentDetailsForm extends StatelessWidget {
  final PaymentState state;
  final Function(String) onAccountIdentifierChanged;
  final Function(double) onAmountChanged;
  final Widget actionButton;

  const PaymentDetailsForm({
    super.key,
    required this.state,
    required this.onAccountIdentifierChanged,
    required this.onAmountChanged,
    required this.actionButton,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: Dimensions.paddingDefault,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildServiceSummary(),
          const SizedBox(height: 32),
          _buildInputLabel("Account/Consumer Number"),
          _buildTextField(
            hint: "Enter number...",
            icon: Icons.numbers,
            onChanged: onAccountIdentifierChanged,
          ),
          const SizedBox(height: 32),
          _buildInputLabel("Amount (NPR)"),
          _buildTextField(
            hint: "0.00",
            icon: Icons.money,
            keyboardType: TextInputType.number,
            onChanged: (val) {
              final amount = double.tryParse(val);
              if (amount != null) onAmountChanged(amount);
            },
          ),
          const SizedBox(height: 16),
          _buildAmountPresets(),
          const SizedBox(height: 48),
          actionButton,
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildAmountPresets() {
    final presets = [100.0, 500.0, 1000.0, 2000.0, 5000.0];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: presets.map((amount) {
        final isSelected = state.amount == amount;
        return InkWell(
          onTap: () => onAmountChanged(amount),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.grey[300]!,
              ),
              boxShadow: isSelected
                  ? [BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 4, offset: const Offset(0, 2))]
                  : null,
            ),
            child: Text(
              "NPR ${amount.toInt()}",
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.textPrimary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildServiceSummary() {
    final service = state.selectedService;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: AppColors.primary.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.business, color: AppColors.primary, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service?.name ?? "Selected Service",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  state.selectedCategory?.name ?? "Category",
                  style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: AppColors.primary),
          filled: true,
          fillColor: Colors.grey[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey[200]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey[200]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }
}
