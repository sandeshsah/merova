import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/enums/app_enum.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import '../bloc/fund_transfer_bloc.dart';
import '../bloc/fund_transfer_event.dart';
import '../bloc/fund_transfer_state.dart';

class TransferOverview extends StatelessWidget {
  final FundTransferState state;
  final Widget actionButton;

  const TransferOverview({
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
          const SizedBox(height: 30),
          _buildOverviewHeader(state),
          const SizedBox(height: 24),
          _buildTransferSummary(state),
          const SizedBox(height: 24),
          _buildInputLabel("Notes"),
          _buildSelectableInput(
            icon: Icons.shopping_bag_outlined,
            hint: state.remarks?.isNotEmpty == true
                ? state.remarks!
                : "Enter Notes here...",
          ),
          const SizedBox(height: 30),
          _buildInputLabel("Select Verification Method"),
          _buildVerificationSelector(context, state),
          const SizedBox(height: 20),
          actionButton,
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildOverviewHeader(FundTransferState state) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.swap_horiz_rounded,
              color: AppColors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Transfer Overview",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                state.selectedType == TransferType.scb
                    ? "SCB Account Transfer"
                    : "Other Bank Transfer",
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransferSummary(FundTransferState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Transfer From",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  state.sourceAccount ?? "My Account",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.account_balance_outlined,
              color: AppColors.textPrimary,
              size: 28,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                "TOTAL AMOUNT",
                "BDT ${state.amount ?? 0.0}",
                "BDT ${state.amount ?? 0.0} + BDT 0.00",
                showBreakdown: true,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                "Transfer To",
                state.selectedBeneficiary?.name ?? "Unknown",
                "",
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSummaryCard(
    String title,
    String value,
    String subValue, {
    bool showBreakdown = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(minHeight: 120),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.greyShade.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          if (subValue.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              subValue,
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.textSecondary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          const SizedBox(height: 16),
          if (showBreakdown)
            const Row(
              children: [
                Text(
                  "View Breakdown",
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.primary,
                  size: 14,
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildVerificationSelector(
    BuildContext context,
    FundTransferState state,
  ) {
    return Row(
      children: [
        Expanded(
          child: _buildVerificationOption(
            context,
            VerificationMethod.biometric,
            Icons.face_retouching_natural_rounded,
            "Biometric",
            state.verificationMethod,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildVerificationOption(
            context,
            VerificationMethod.email,
            Icons.mail_outline_rounded,
            "Email",
            state.verificationMethod,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildVerificationOption(
            context,
            VerificationMethod.sms,
            Icons.phonelink_setup_rounded,
            "SMS",
            state.verificationMethod,
          ),
        ),
      ],
    );
  }

  Widget _buildVerificationOption(
    BuildContext context,
    VerificationMethod method,
    IconData icon,
    String label,
    VerificationMethod? selected,
  ) {
    final isSelected = selected == method;
    return GestureDetector(
      onTap: () => context.read<FundTransferBloc>().add(
            SelectVerificationMethod(method),
          ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.greyShade.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildSelectableInput({
    required IconData icon,
    required String hint,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.greyShade.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.textPrimary, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                hint,
                style: TextStyle(
                  color: AppColors.textSecondary.withOpacity(0.5),
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.primary,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
