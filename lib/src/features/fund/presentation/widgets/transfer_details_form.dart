import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import 'package:merova/src/core/enums/app_enum.dart';
import '../bloc/fund_transfer_bloc.dart';
import '../bloc/fund_transfer_event.dart';
import '../bloc/fund_transfer_state.dart';
import '../../domain/entity/transfer_entity.dart';

class TransferDetailsForm extends StatefulWidget {
  final FundTransferState state;
  final Widget actionButton;

  const TransferDetailsForm({
    super.key,
    required this.state,
    required this.actionButton,
  });

  @override
  State<TransferDetailsForm> createState() => _TransferDetailsFormState();
}

class _TransferDetailsFormState extends State<TransferDetailsForm> {
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _beneficiaryController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _updateControllers();
  }

  @override
  void didUpdateWidget(TransferDetailsForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state != oldWidget.state) {
      _updateControllers();
    }
  }

  void _updateControllers() {
    if (_sourceController.text != (widget.state.sourceAccount ?? "")) {
      _sourceController.text = widget.state.sourceAccount ?? "";
    }
    if (_beneficiaryController.text != (widget.state.selectedBeneficiary?.name ?? "")) {
      _beneficiaryController.text = widget.state.selectedBeneficiary?.name ?? "";
    }
    if (_accountNumberController.text != (widget.state.accountNumber ?? "")) {
      _accountNumberController.text = widget.state.accountNumber ?? "";
    }
    if (_bankNameController.text != (widget.state.bankName ?? "")) {
      _bankNameController.text = widget.state.bankName ?? "";
    }
    if (_amountController.text != (widget.state.amount?.toString() ?? "")) {
      _amountController.text = widget.state.amount?.toString() ?? "";
    }
  }

  @override
  void dispose() {
    _sourceController.dispose();
    _beneficiaryController.dispose();
    _accountNumberController.dispose();
    _bankNameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isOtherBank = widget.state.selectedType == TransferType.otherBank;
    final selectedMethod = widget.state.otherBankMethod ?? 'BEFTN';

    return SingleChildScrollView(
      padding: Dimensions.paddingDefault,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStepHeader("Please enter the transfer details"),
          if (isOtherBank) ...[
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
          ],
          _buildInputLabel("Transfer From"),
          _buildDynamicInput(
            controller: _sourceController,
            icon: Icons.account_balance_outlined,
            hint: "Select Source",
            onTap: () => _showAccountPicker(context),
            onChanged: (val) => context.read<FundTransferBloc>().add(UpdateDetails(sourceAccount: val)),
          ),
          const SizedBox(height: 24),
          _buildInputLabel("Transfer To (Beneficiary)"),
          _buildDynamicInput(
            controller: _beneficiaryController,
            icon: Icons.person_outline_rounded,
            hint: "Select or enter a beneficiary name",
            onTap: () => _showBeneficiaryPicker(context),
            onChanged: (val) => context.read<FundTransferBloc>().add(UpdateDetails(selectedBeneficiary: TransferContactEntity(id: '', name: val, accountNumber: _accountNumberController.text))),
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
          _buildDynamicInput(
            controller: _accountNumberController,
            icon: Icons.account_balance_wallet_outlined,
            hint: "After Select Beneficiary, it appears here",
            onChanged: (val) => context.read<FundTransferBloc>().add(UpdateDetails(accountNumber: val)),
          ),
          const SizedBox(height: 24),
          if (isOtherBank) ...[
            _buildInputLabel("Bank Name"),
            _buildDynamicInput(
              controller: _bankNameController,
              icon: Icons.account_balance_outlined,
              hint: "Enter bank name...",
              onTap: () => _showBankPicker(context),
              onChanged: (val) => context.read<FundTransferBloc>().add(UpdateDetails(bankName: val)),
            ),
            const SizedBox(height: 24),
          ],
          _buildInputLabel("Transfer Amount"),
          _buildDynamicInput(
            controller: _amountController,
            icon: Icons.shopping_bag_outlined,
            hint: "Enter Amount here...",
            keyboardType: TextInputType.number,
            onChanged: (val) {
              final amount = double.tryParse(val);
              context.read<FundTransferBloc>().add(UpdateDetails(amount: amount));
            },
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
          const SizedBox(height: 20),
          widget.actionButton,
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildStepHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
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

  Widget _buildDynamicInput({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    VoidCallback? onTap,
    ValueChanged<String>? onChanged,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.textSecondary.withOpacity(0.5),
          fontSize: 14,
        ),
        prefixIcon: Icon(icon, color: AppColors.textPrimary, size: 24),
        suffixIcon: onTap != null 
          ? const Icon(Icons.arrow_drop_down_rounded, color: AppColors.primary, size: 30)
          : null,
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.greyShade.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.greyShade.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }

  void _showAccountPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Select Source Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.account_balance_wallet_outlined),
                title: const Text("Savings Account (...4321)"),
                subtitle: const Text("Balance: BDT 125,400.00"),
                onTap: () {
                  context.read<FundTransferBloc>().add(const UpdateDetails(
                      sourceAccount: "Savings Account (...4321)"));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_balance_wallet_outlined),
                title: const Text("Current Account (...8899)"),
                subtitle: const Text("Balance: BDT 50,000.00"),
                onTap: () {
                  context.read<FundTransferBloc>().add(const UpdateDetails(
                      sourceAccount: "Current Account (...8899)"));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showBeneficiaryPicker(BuildContext context) {
    final contacts = widget.state.contacts ?? [];
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Select Beneficiary",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              if (contacts.isEmpty)
                const Text("No beneficiaries found")
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      final contact = contacts[index];
                      return ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.person)),
                        title: Text(contact.name),
                        subtitle: Text(contact.accountNumber),
                        onTap: () {
                          context.read<FundTransferBloc>().add(UpdateDetails(
                                selectedBeneficiary: contact,
                                accountNumber: contact.accountNumber,
                              ));
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _showBankPicker(BuildContext context) {
    final banks = ["City Bank", "Standard Chartered", "Dutch-Bangla Bank", "BRAC Bank"];
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Select Bank",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              ...banks.map((bank) => ListTile(
                    title: Text(bank),
                    onTap: () {
                      context
                          .read<FundTransferBloc>()
                          .add(UpdateDetails(bankName: bank));
                      Navigator.pop(context);
                    },
                  )),
            ],
          ),
        );
      },
    );
  }
}
