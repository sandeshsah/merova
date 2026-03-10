import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:merova/src/core/routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import 'package:merova/src/core/widget/header_positioned.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/enums/app_enum.dart';
import '../bloc/payment_bloc.dart';
import '../bloc/payment_event.dart';
import '../bloc/payment_state.dart';
import '../widgets/payment_category_selector.dart';
import '../widgets/payment_service_selector.dart';
import '../widgets/payment_details_form.dart';
import '../widgets/payment_overview.dart';
import 'package:merova/src/init_dependencies.dart';

@RoutePage()
class PaymentPages extends StatelessWidget {
  const PaymentPages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PaymentBloc>()..add(const FetchCategories()),
      child: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          final title = _getTitle(state.currentStep);
          final showBack = state.currentStep != PaymentStep.selectCategory;

          return AppBarBackground(
            title: title,
            centerTitle: true,
            showBack: true,
            onBack: showBack
                ? () => context.read<PaymentBloc>().add(const PreviousStep())
                : null,
            body: Stack(
              children: [
                BodyPositioned(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: _buildBody(context, state),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _getTitle(PaymentStep step) {
    switch (step) {
      case PaymentStep.selectCategory:
        return "Bill Payment";
      case PaymentStep.selectService:
        return "Select Provider";
      case PaymentStep.enterDetails:
        return "Payment Details";
      case PaymentStep.overview:
        return "Overview";
      case PaymentStep.pinVerification:
        return "Verify PIN";
      case PaymentStep.success:
        return "Payment Successful";
    }
  }

  Widget _buildBody(BuildContext context, PaymentState state) {
    debugPrint(
      "PaymentPages: Building body for step: ${state.currentStep}, status: ${state.status}",
    );

    return Column(
      children: [
        _buildStepProgress(state.currentStep),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.05, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              );
            },
            child: _getStepWidget(context, state),
          ),
        ),
      ],
    );
  }

  Widget _buildStepProgress(PaymentStep currentStep) {
    final steps = PaymentStep.values
        .where((e) => e != PaymentStep.success)
        .toList();
    final currentIndex = steps.indexOf(currentStep);
    if (currentIndex == -1) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: List.generate(steps.length, (index) {
          final isActive = index <= currentIndex;
          return Expanded(
            child: Container(
              height: 4,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : Colors.grey[200],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _getStepWidget(BuildContext context, PaymentState state) {
    if (state.status == PaymentStatus.loading) {
      return const Center(
        key: ValueKey('loading'),
        child: CircularProgressIndicator(),
      );
    }

    if (state.status == PaymentStatus.error) {
      return Center(
        key: const ValueKey('error'),
        child: Text(state.message ?? "An error occurred"),
      );
    }

    switch (state.currentStep) {
      case PaymentStep.selectCategory:
        return PaymentCategorySelector(
          key: const ValueKey('selectCategory'),
          categories: state.categories ?? [],
          onCategorySelected: (cat) =>
              context.read<PaymentBloc>().add(SelectCategory(cat)),
        );
      case PaymentStep.selectService:
        return PaymentServiceSelector(
          key: const ValueKey('selectService'),
          services: state.services ?? [],
          onServiceSelected: (srv) =>
              context.read<PaymentBloc>().add(SelectService(srv)),
        );
      case PaymentStep.enterDetails:
        return PaymentDetailsForm(
          key: const ValueKey('enterDetails'),
          state: state,
          onAccountIdentifierChanged: (val) => context.read<PaymentBloc>().add(
            UpdatePaymentDetails(accountIdentifier: val),
          ),
          onAmountChanged: (val) => context.read<PaymentBloc>().add(
            UpdatePaymentDetails(amount: val),
          ),
          actionButton: _buildActionButton(
            context,
            "Continue",
            () => context.read<PaymentBloc>().add(const NextStep()),
          ),
        );
      case PaymentStep.overview:
        return PaymentOverview(
          key: const ValueKey('overview'),
          state: state,
          actionButton: _buildActionButton(
            context,
            "Pay Now",
            () => context.read<PaymentBloc>().add(const NextStep()),
          ),
        );
      case PaymentStep.pinVerification:
        return _buildPinVerification(context, state);
      case PaymentStep.success:
        return _buildSuccess(context, state);
    }
  }

  Widget _buildActionButton(
    BuildContext context,
    String text,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            shadowColor: AppColors.primary.withOpacity(0.4),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPinVerification(BuildContext context, PaymentState state) {
    return Padding(
      padding: Dimensions.paddingDefault,
      child: Column(
        children: [
          const Icon(Icons.lock_outline, size: 64, color: AppColors.primary),
          const SizedBox(height: 24),
          const Text(
            "Security Verification",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text(
            "Please enter your transaction PIN to authorize this payment.",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 80),
          _buildActionButton(
            context,
            "Verify & Pay",
            () => context.read<PaymentBloc>().add(const NextStep()),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccess(BuildContext context, PaymentState state) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: Dimensions.paddingDefault,
            decoration: BoxDecoration(
              color: AppColors.grey.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 80,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Payment Successful!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "Your payment of NPR ${state.amount} to ${state.selectedService?.name} was processed successfully.",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 100),
          _buildActionButton(
            context,
            "Finish",
            () => context.router.replaceAll([const PaymentRoutes()]),
          ),
        ],
      ),
    );
  }
}
