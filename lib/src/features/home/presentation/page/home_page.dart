import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merova/src/core/extension/context_extensions.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/themes/app_text_styles.dart';
import 'package:merova/src/core/themes/dimensions.dart';
import 'package:merova/src/core/widget/balance_card.dart';
import 'package:merova/src/core/widget/button_nav_bar.dart';
import 'package:merova/src/core/widget/feature_button.dart';
import 'package:merova/src/core/widget/padding_provider_widget.dart';
import 'package:merova/src/core/widget/transaction_item.dart';
import 'package:merova/src/features/fund/presentation/pages/fund_transfer.dart';
import 'package:merova/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:merova/src/features/payment/presentation/pages/payment_pages.dart';
import 'package:merova/src/features/profile/presentation/pages/profile_pages.dart';
import 'package:merova/src/init_dependencies.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const _HomeContentWrapper(),
    const PaymentPages(),
    const Center(child: Text('Scanner Page')),
    const FundTransferPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBody: true,
      body: _pages[_currentIndex],
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

class _HomeContentWrapper extends StatelessWidget {
  const _HomeContentWrapper();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(FetchHomeData()),
      child: const _HomeContentBody(),
    );
  }
}

class _HomeContentBody extends StatefulWidget {
  const _HomeContentBody();

  @override
  State<_HomeContentBody> createState() => _HomeContentBodyState();
}

class _HomeContentBodyState extends State<_HomeContentBody> {
  bool _isBalanceVisible = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeError) {
          return Center(child: Text(state.message));
        } else if (state is HomeLoaded) {
          final data = state.homeData;
          return _HomeContent(
            data: data,
            isBalanceVisible: _isBalanceVisible,
            onVisibilityToggle: () {
              setState(() {
                _isBalanceVisible = !_isBalanceVisible;
              });
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _HomeContent extends StatelessWidget {
  final dynamic data;
  final bool isBalanceVisible;
  final VoidCallback? onVisibilityToggle;

  const _HomeContent({
    required this.data,
    this.isBalanceVisible = true,
    this.onVisibilityToggle,
  });

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
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
              decoration: const BoxDecoration(gradient: AppColors.homeGradient),
              child: SafeArea(
                child: Padding(
                  padding: Dimensions.paddingSmall,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tr.welcomeBack,
                                style: AppTextStyles.homeText,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                data.user.fullName,
                                style: const TextStyle(
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
                                onPressed: () {},
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
                        balance: data.account.formattedBalance,
                        isVisible: isBalanceVisible,
                        onVisibilityToggle: onVisibilityToggle ?? () {},
                        accountType: data.account.accountType,
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
                      onTap: () {},
                    ),
                    FeatureButton(
                      icon: Icons.receipt_long,
                      label: "Pay Bills",
                      onTap: () {},
                    ),
                    FeatureButton(
                      icon: Icons.phone_android,
                      label: "Mobile\nRecharge",
                      onTap: () {},
                    ),
                    FeatureButton(
                      icon: Icons.more_horiz,
                      label: "More",
                      onTap: () {},
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
                      onTap: () {},
                    ),
                    FeatureButton(
                      icon: Icons.credit_card,
                      label: "Cards",
                      onTap: () {},
                    ),
                    FeatureButton(
                      icon: Icons.savings,
                      label: "Savings",
                      onTap: () {},
                    ),
                    FeatureButton(
                      icon: Icons.analytics,
                      label: "Analytics",
                      onTap: () {},
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
                      onPressed: () {},
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
                ...data.transactions.map<Widget>(
                  (transaction) => TransactionItem(
                    icon: transaction.icon,
                    title: transaction.title,
                    subtitle: transaction.subtitle,
                    amount: transaction.formattedAmount,
                    isDebit: transaction.isDebit,
                    iconBackgroundColor: transaction.iconBackgroundColor,
                  ),
                ),

                const SizedBox(height: 90),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
