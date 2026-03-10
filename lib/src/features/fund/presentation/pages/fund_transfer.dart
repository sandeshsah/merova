import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merova/src/core/enums/app_enum.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import 'package:merova/src/core/widget/header_positioned.dart';
import 'package:merova/src/init_dependencies.dart';
import '../bloc/fund_transfer_bloc.dart';
import '../bloc/fund_transfer_event.dart';
import '../bloc/fund_transfer_state.dart';
import '../../domain/entity/transfer_entity.dart';
import '../widgets/transfer_option_selector.dart';
import '../widgets/transfer_details_form.dart';
import '../widgets/transfer_overview.dart';
import '../widgets/transfer_pin_verification.dart';
import '../widgets/transfer_success_dialog.dart';

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
    final actionButton = _buildNextButton(context, state);

    switch (state.currentStep) {
      case TransferStep.selectOption:
        return TransferOptionSelector(state: state);
      case TransferStep.enterDetails:
        return TransferDetailsForm(state: state, actionButton: actionButton);
      case TransferStep.overview:
        return TransferOverview(state: state, actionButton: actionButton);
      case TransferStep.pinVerification:
        return TransferPinVerification(state: state, actionButton: actionButton);
      case TransferStep.success:
        return const SizedBox.shrink();
    }
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

  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => TransferSuccessDialog(message: message),
    );
  }
}
