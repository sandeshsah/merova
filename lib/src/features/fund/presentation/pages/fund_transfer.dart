import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import 'package:merova/src/core/widget/header_positioned.dart';
import 'package:merova/src/init_dependencies.dart';
import '../bloc/fund_transfer_bloc.dart';
import '../bloc/fund_transfer_event.dart';
import '../bloc/fund_transfer_state.dart';
import '../../domain/entity/transfer_entity.dart';

@RoutePage()
class FundTransferPage extends StatefulWidget {
  const FundTransferPage({super.key});

  @override
  State<FundTransferPage> createState() => _FundTransferPageState();
}

class _FundTransferPageState extends State<FundTransferPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<FundTransferBloc>()..add(const FetchRecentContacts()),
      child: BlocConsumer<FundTransferBloc, FundTransferState>(
        listener: (context, state) {
          if (state.status == FundTransferStatus.success) {
            _showSuccessDialog(
              context,
              state.result?.message ?? "Transfer Successful",
            );
          } else if (state.status == FundTransferStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message ?? "An error occurred"),
                backgroundColor: AppColors.error,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        builder: (context, state) {
          String title = "Fund Transfer";
          String? subtitle;

          if (state.currentStep != TransferStep.selectOption) {
            if (state.selectedType == TransferType.scb) {
              title = "Merova";
              subtitle = "Transfer within Same Bank";
            } else if (state.selectedType == TransferType.otherBank) {
              title = "Other Bank Transfer";
            } else if (state.selectedType == TransferType.mobileBanking) {
              title = "Mobile Banking";
            }
          }

          if (state.currentStep == TransferStep.overview) {
            title = "Fund Transfer";
            subtitle = null;
          } else if (state.currentStep == TransferStep.pinVerification) {
            title = "Verification";
            subtitle = null;
          }

          return AppBarBackground(
            title: title,
            subtitle: subtitle,
            centerTitle: true,
            showBack: true,
            onBack: () {
              if (state.currentStep == TransferStep.selectOption) {
                context.router.back();
              } else {
                context.read<FundTransferBloc>().add(const PreviousStep());
              }
            },
            body: Stack(
              children: [
                BodyPositioned(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: _buildBody(context, state)),
                        if (state.currentStep != TransferStep.selectOption &&
                            state.currentStep != TransferStep.success)
                          SafeArea(
                            top: false,
                            child: _buildNextButton(context, state),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, FundTransferState state) {
    switch (state.currentStep) {
      case TransferStep.selectOption:
        return _buildOptionSelector(context, state);
      case TransferStep.enterDetails:
        return _buildDetailsForm(context, state);
      case TransferStep.overview:
        return _buildOverview(context, state);
      case TransferStep.pinVerification:
        return _buildPinVerification(context, state);
      case TransferStep.success:
        return const SizedBox.shrink();
    }
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

  Widget _buildOptionSelector(BuildContext context, FundTransferState state) {
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

  Widget _buildDetailsForm(BuildContext context, FundTransferState state) {
    final isOtherBank = state.selectedType == TransferType.otherBank;
    final selectedMethod = state.otherBankMethod ?? 'BEFTN';

    return SingleChildScrollView(
      padding: Dimensions.paddingDefault,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isOtherBank) ...[
            _buildStepHeader("Please enter the transfer details"),
            _buildOtherBankTabs(context, selectedMethod),
            const SizedBox(height: 8),
            Text(
              _getOtherBankSubtext(selectedMethod),
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
          ] else
            _buildStepHeader("Please enter the transfer details"),
          _buildInputLabel("Transfer From"),
          _buildSelectableInput(
            icon: Icons.account_balance_outlined,
            hint: state.sourceAccount ?? "Select Source",
            onTap: () {},
          ),
          const SizedBox(height: 24),
          _buildInputLabel("Transfer To (Beneficiary)"),
          _buildSelectableInput(
            icon: Icons.person_outline_rounded,
            hint: state.selectedBeneficiary?.name ??
                "Select or enter a beneficiary account",
            onTap: () {},
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: null,
              child: Text(
                "If Beneficiary not added then use manually added",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildInputLabel("Account Number"),
          _buildSelectableInput(
            icon: Icons.account_balance_wallet_outlined,
            hint: state.accountNumber ??
                "After Select Beneficiary, it appears here",
          ),
          const SizedBox(height: 24),
          if (isOtherBank) ...[
            _buildInputLabel("Bank Name"),
            _buildSelectableInput(
              icon: Icons.account_balance_outlined,
              hint: state.bankName ?? "Enter bank name...",
            ),
            const SizedBox(height: 24),
          ],
          _buildInputLabel("Transfer Amount"),
          _buildSelectableInput(
            icon: Icons.shopping_bag_outlined,
            hint: state.amount != null
                ? state.amount.toString()
                : "Enter Amount here...",
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                color: AppColors.textSecondary,
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                "Schedule Amount",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              Checkbox(
                value: false,
                onChanged: (v) {},
                activeColor: AppColors.primary,
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildOtherBankTabs(BuildContext context, String selected) {
    return Row(
      children: ["BEFTN", "NPSB", "RTGS"].map((method) {
        final isSelected = selected == method;
        return Expanded(
          child: GestureDetector(
            onTap: () => context.read<FundTransferBloc>().add(
                  UpdateDetails(otherBankMethod: method),
                ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: Dimensions.paddingDefault,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.greyShade.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  method,
                  style: TextStyle(
                    color: isSelected
                        ? AppColors.white
                        : AppColors.textSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  String _getOtherBankSubtext(String method) {
    switch (method) {
      case "BEFTN":
        return "Transfer to other banks within 24 hours (one working day).";
      case "NPSB":
        return "Fast transfer to other banks, completed within minutes.";
      case "RTGS":
        return "Large payments processed with RTGS during business hours";
      default:
        return "";
    }
  }

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: Dimensions.paddingDefault,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
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

  Widget _buildNextButton(BuildContext context, FundTransferState state) {
    final isPinStep = state.currentStep == TransferStep.pinVerification;

    return Padding(
      padding: Dimensions.paddingDefault,
      child: ElevatedButton(
        onPressed: () {
          if (isPinStep) {
            final request = TransferRequestEntity(
              recipientId: state.selectedBeneficiary?.id ?? '',
              recipientName:
                  state.selectedBeneficiary?.name ?? state.accountNumber ?? '',
              recipientAccountNumber:
                  state.accountNumber ??
                  state.selectedBeneficiary?.accountNumber ??
                  '',
              amount: state.amount ?? 0,
              remarks: state.remarks ?? '',
              bankName: state.bankName ?? '',
            );
            context.read<FundTransferBloc>().add(
              PerformTransfer(request: request),
            );
          } else {
            context.read<FundTransferBloc>().add(const NextStep());
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: Text(
          isPinStep ? "Submit" : "Next",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildOverview(BuildContext context, FundTransferState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
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

  Widget _buildPinVerification(BuildContext context, FundTransferState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Please wait while verify your mobile number.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const Text(
            "An OTP has been sent to your registered mobile number.",
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 60),
          const Text(
            "Enter Your PIN",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Please enter your PIN to confirm payment",
            style: TextStyle(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.greyShade.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "120 seconds left to expire.",
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            "Don't receive the code?",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textPrimary,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Resend",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColors.success,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 40),
              ),
              const SizedBox(height: 24),
              const Text(
                "Successful",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                "Payment transfer successfully sent!",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "View Receipt",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.router.pop();
                },
                child: const Text(
                  "Home",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
