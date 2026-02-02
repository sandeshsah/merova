import 'package:auth/src/core/themes/app_colors.dart';
import 'package:auth/src/core/widget/balance_card.dart';
import 'package:auth/src/core/widget/button_nav_bar.dart';
import 'package:auth/src/core/widget/feature_button.dart';
import 'package:auth/src/core/widget/padding_provider_widget.dart';
import 'package:auth/src/core/widget/transaction_item.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool _isBalanceVisible = true;

  final List<Widget> _pages = [
    const _HomeContent(),
    const Center(child: Text('OTP Page')),
    const Center(child: Text('Scanner Page')),
    const Center(child: Text('Government Page')),
    const Center(child: Text('Settings Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _currentIndex == 0
          ? _HomeContent(
              isBalanceVisible: _isBalanceVisible,
              onVisibilityToggle: () {
                setState(() {
                  _isBalanceVisible = !_isBalanceVisible;
                });
              },
            )
          : _pages[_currentIndex],
      bottomNavigationBar: ButtonNavBar(
        currentIndex: _currentIndex,
        onIndexChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        onScannerTap: () {
          setState(() {
            _currentIndex = 2;
          });
        },
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  final bool isBalanceVisible;
  final VoidCallback? onVisibilityToggle;

  const _HomeContent({this.isBalanceVisible = true, this.onVisibilityToggle});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // App Bar with Gradient
        SliverAppBar(
          expandedHeight: 280,
          floating: false,
          pinned: true,
          backgroundColor: AppColors.primary,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF147BA0), Color(0xFF3FBCE6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Welcome Back,",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "John Doe",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.notifications_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: () {

                                },
                              ),
                              const SizedBox(width: 4),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: const Icon(
                                  Icons.person,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Balance Card
                      BalanceCard(
                        balance: "NPR 1,25,450.00",
                        isVisible: isBalanceVisible,
                        onVisibilityToggle: onVisibilityToggle ?? () {},
                        accountType: "Current Account",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        // Main Content
        SliverToBoxAdapter(
          child: PaddingProviderWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),

                // Quick Actions Section
                const Text(
                  "Quick Actions",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 16),

                // Feature Buttons Grid
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FeatureButton(
                      icon: Icons.send,
                      label: "Transfer",
                      onTap: () {

                      },
                    ),
                    FeatureButton(
                      icon: Icons.receipt_long,
                      label: "Pay Bills",
                      onTap: () {

                      },
                    ),
                    FeatureButton(
                      icon: Icons.phone_android,
                      label: "Mobile\nRecharge",
                      onTap: () {

                      },
                    ),
                    FeatureButton(
                      icon: Icons.more_horiz,
                      label: "More",
                      onTap: () {

                      },
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Second Row of Features
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FeatureButton(
                      icon: Icons.account_balance,
                      label: "Bank\nTransfer",
                      onTap: () {

                      },
                    ),
                    FeatureButton(
                      icon: Icons.credit_card,
                      label: "Cards",
                      onTap: () {

                      },
                    ),
                    FeatureButton(
                      icon: Icons.savings,
                      label: "Savings",
                      onTap: () {

                      },
                    ),
                    FeatureButton(
                      icon: Icons.analytics,
                      label: "Analytics",
                      onTap: () {

                      },
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Recent Transactions Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Recent Transactions",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    TextButton(
                      onPressed: () {

                      },
                      child: const Text(
                        "See All",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Transaction List
                TransactionItem(
                  icon: Icons.shopping_bag,
                  title: "Shopping",
                  subtitle: "Amazon Store",
                  amount: "NPR 5,240.00",
                  isDebit: true,
                  iconBackgroundColor: AppColors.error,
                ),

                TransactionItem(
                  icon: Icons.account_balance_wallet,
                  title: "Salary Received",
                  subtitle: "Monthly Salary",
                  amount: "NPR 85,000.00",
                  isDebit: false,
                  iconBackgroundColor: AppColors.success,
                ),

                TransactionItem(
                  icon: Icons.restaurant,
                  title: "Restaurant",
                  subtitle: "Cafe Delight",
                  amount: "NPR 1,850.00",
                  isDebit: true,
                  iconBackgroundColor: const Color(0xFFFF9800),
                ),

                TransactionItem(
                  icon: Icons.local_gas_station,
                  title: "Fuel",
                  subtitle: "Petrol Pump",
                  amount: "NPR 3,200.00",
                  isDebit: true,
                  iconBackgroundColor: const Color(0xFF9C27B0),
                ),

                TransactionItem(
                  icon: Icons.phone_android,
                  title: "Mobile Recharge",
                  subtitle: "Ncell Prepaid",
                  amount: "NPR 500.00",
                  isDebit: true,
                  iconBackgroundColor: const Color(0xFF2196F3),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
