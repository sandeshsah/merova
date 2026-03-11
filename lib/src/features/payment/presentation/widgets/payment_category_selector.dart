import 'package:flutter/material.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import '../../domain/entity/payment_entity.dart';

class PaymentCategorySelector extends StatelessWidget {
  final List<PaymentCategoryEntity> categories;
  final Function(PaymentCategoryEntity) onCategorySelected;

  const PaymentCategorySelector({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Recent Payments Section
        SliverToBoxAdapter(
          child: _buildRecentPayments(),
        ),

        // Categories Title
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          sliver: SliverToBoxAdapter(
            child: Text(
              "All Services",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        // Categories Grid
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverLayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.crossAxisExtent > 600 ? 5 : 3;
              return SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final category = categories[index];
                    return _CategoryItem(
                      name: category.name,
                      icon: _getIcon(category.icon),
                      onTap: () => onCategorySelected(category),
                    );
                  },
                  childCount: categories.length,
                ),
              );
            },
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 100)),
      ],
    );
  }

  Widget _buildRecentPayments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: Text(
            "Recent Payments",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 5, // Mock count
            itemBuilder: (context, index) {
              return _RecentItem(
                name: index == 0 ? "DESCO" : "Water Bill",
                id: "123456",
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'phone_android': return Icons.phone_android;
      case 'bolt': return Icons.bolt;
      case 'water_drop': return Icons.water_drop;
      case 'wifi': return Icons.wifi;
      case 'tv': return Icons.tv;
      case 'security': return Icons.security;
      default: return Icons.payments;
    }
  }
}

class _RecentItem extends StatelessWidget {
  final String name;
  final String id;
  final VoidCallback onTap;

  const _RecentItem({required this.name, required this.id, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.history, color: Colors.white, size: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  id,
                  style: const TextStyle(fontSize: 10, color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onTap;

  const _CategoryItem({
    required this.name,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      elevation: 1,
      shadowColor: Colors.black.withOpacity(0.05),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary.withOpacity(0.1), AppColors.primary.withOpacity(0.05)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.primary, size: 24),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
