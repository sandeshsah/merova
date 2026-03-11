import 'package:flutter/material.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import '../../domain/entity/payment_entity.dart';

class PaymentServiceSelector extends StatelessWidget {
  final List<PaymentServiceEntity> services;
  final Function(PaymentServiceEntity) onServiceSelected;

  const PaymentServiceSelector({
    super.key,
    required this.services,
    required this.onServiceSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (services.isEmpty) {
      return const Center(child: Text("No services found for this category"));
    }

    return ListView.separated(
      padding: Dimensions.paddingDefault,
      itemCount: services.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final service = services[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.business, color: AppColors.primary),
          ),
          title: Text(
            service.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(service.description),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.primary),
          onTap: () => onServiceSelected(service),
        );
      },
    );
  }
}
