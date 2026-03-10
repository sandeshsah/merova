import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import 'package:merova/src/core/enums/app_enum.dart';
import '../bloc/fund_transfer_bloc.dart';
import '../bloc/fund_transfer_event.dart';
import '../bloc/fund_transfer_state.dart';

class TransferOptionSelector extends StatelessWidget {
  final FundTransferState state;

  const TransferOptionSelector({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStepHeader("Select Transfer Option"),
        Expanded(
          child: ListView(
            padding: Dimensions.paddingDefault,
            children: [
              _buildOptionCard(
                icon: Icons.account_balance_outlined,
                title: "Merova",
                subtitle: "Transfer within Same Bank",
                onTap: () => context.read<FundTransferBloc>().add(
                      const SelectTransferType(TransferType.scb),
                    ),
              ),
              _buildOptionCard(
                icon: Icons.swap_horiz_rounded,
                title: "Other Bank",
                subtitle: "Transfer to Other Banks",
                onTap: () => context.read<FundTransferBloc>().add(
                      const SelectTransferType(TransferType.otherBank),
                    ),
              ),
              _buildOptionCard(
                icon: Icons.phonelink_setup_rounded,
                title: "Mobile Banking",
                subtitle: "Transfer Though Mobile",
                onTap: () => context.read<FundTransferBloc>().add(
                      const SelectTransferType(TransferType.mobileBanking),
                    ),
              ),
              Row(
                children: [
                  Expanded(child: _buildQuickAction("SC Transfer History")),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildQuickAction("Local Transfer History"),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildQuickAction("View Standing Orders")),
                ],
              ),
              const SizedBox(height: 40),
              _buildOptionCard(
                icon: Icons.person_add_alt_1_outlined,
                title: "Beneficiary",
                subtitle: "Add New Beneficiary",
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStepHeader(String title) {
    return Padding(
      padding: Dimensions.paddingDefault,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.textPrimary, size: 28),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.textPrimary,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColors.primary,
          size: 16,
        ),
      ),
    );
  }

  Widget _buildQuickAction(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.greyShade.withOpacity(0.3)),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
