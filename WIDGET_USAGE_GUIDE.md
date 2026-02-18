# Widget Usage Guide

## Common Widgets for Banking App

This guide shows how to use the newly created common widgets in your banking application.

---

## 1. BalanceCard Widget

**Location:** `lib/src/core/widget/balance_card.dart`

**Purpose:** Display account balance with visibility toggle

### Usage Example:

```dart
import 'package:auth/src/core/widget/balance_card.dart';

// In your stateful widget
bool _isBalanceVisible = true;

// In your build method
BalanceCard(
  balance: "NPR 1,25,450.00",
  isVisible: _isBalanceVisible,
  onVisibilityToggle: () {
    setState(() {
      _isBalanceVisible = !_isBalanceVisible;
    });
  },
  accountType: "Current Account", // Optional, defaults to "Current Account"
)
```

### Parameters:
- `balance` (required): String - The balance amount to display
- `isVisible` (required): bool - Whether to show the balance or hide it with dots
- `onVisibilityToggle` (required): VoidCallback - Function to call when eye icon is tapped
- `accountType` (optional): String - The type of account (defaults to "Current Account")

---

## 2. FeatureButton Widget

**Location:** `lib/src/core/widget/feature_button.dart`

**Purpose:** Create consistent action buttons for banking features

### Usage Example:

```dart
import 'package:auth/src/core/widget/feature_button.dart';

FeatureButton(
  icon: Icons.send,
  label: "Transfer",
  onTap: () {
    // Navigate to transfer page
    Navigator.push(...);
  },
  backgroundColor: AppColors.primary.withOpacity(0.1), // Optional
  iconColor: AppColors.primary, // Optional
)
```

### Parameters:
- `icon` (required): IconData - The icon to display
- `label` (required): String - The text label below the icon
- `onTap` (required): VoidCallback - Function to call when button is tapped
- `backgroundColor` (optional): Color - Background color of the icon container
- `iconColor` (optional): Color - Color of the icon

### Grid Layout Example:

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    FeatureButton(icon: Icons.send, label: "Transfer", onTap: () {}),
    FeatureButton(icon: Icons.receipt_long, label: "Pay Bills", onTap: () {}),
    FeatureButton(icon: Icons.phone_android, label: "Mobile\nRecharge", onTap: () {}),
    FeatureButton(icon: Icons.more_horiz, label: "More", onTap: () {}),
  ],
)
```

---

## 3. TransactionItem Widget

**Location:** `lib/src/core/widget/transaction_item.dart`

**Purpose:** Display individual transaction items in a list

### Usage Example:

```dart
import 'package:auth/src/core/widget/transaction_item.dart';

// Debit transaction
TransactionItem(
  icon: Icons.shopping_bag,
  title: "Shopping",
  subtitle: "Amazon Store",
  amount: "NPR 5,240.00",
  isDebit: true,
  iconBackgroundColor: AppColors.error,
)

// Credit transaction
TransactionItem(
  icon: Icons.account_balance_wallet,
  title: "Salary Received",
  subtitle: "Monthly Salary",
  amount: "NPR 85,000.00",
  isDebit: false,
  iconBackgroundColor: AppColors.success,
)
```

### Parameters:
- `icon` (required): IconData - The icon to display
- `title` (required): String - The transaction title
- `subtitle` (required): String - The transaction subtitle/description
- `amount` (required): String - The transaction amount
- `isDebit` (optional): bool - Whether this is a debit (true) or credit (false) transaction
- `iconBackgroundColor` (optional): Color - Background color of the icon container

### List Example:

```dart
Column(
  children: [
    TransactionItem(
      icon: Icons.shopping_bag,
      title: "Shopping",
      subtitle: "Amazon Store",
      amount: "NPR 5,240.00",
      isDebit: true,
      iconBackgroundColor: AppColors.error,
    ),
    TransactionItem(
      icon: Icons.restaurant,
      title: "Restaurant",
      subtitle: "Cafe Delight",
      amount: "NPR 1,850.00",
      isDebit: true,
      iconBackgroundColor: const Color(0xFFFF9800),
    ),
    // Add more transactions...
  ],
)
```

---

## Complete Page Example

Here's how to combine all widgets in a page:

```dart
import 'package:flutter/material.dart';
import 'package:auth/src/core/widget/balance_card.dart';
import 'package:auth/src/core/widget/feature_button.dart';
import 'package:auth/src/core/widget/transaction_item.dart';
import 'package:auth/src/core/widget/padding_provider_widget.dart';

class MyBankingPage extends StatefulWidget {
  @override
  State<MyBankingPage> createState() => _MyBankingPageState();
}

class _MyBankingPageState extends State<MyBankingPage> {
  bool _isBalanceVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: PaddingProviderWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Balance Card
              BalanceCard(
                balance: "NPR 1,25,450.00",
                isVisible: _isBalanceVisible,
                onVisibilityToggle: () {
                  setState(() {
                    _isBalanceVisible = !_isBalanceVisible;
                  });
                },
              ),
              
              SizedBox(height: 24),
              
              // Feature Buttons
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
                    label: "Recharge",
                    onTap: () {},
                  ),
                ],
              ),
              
              SizedBox(height: 24),
              
              // Transactions
              Text(
                "Recent Transactions",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              SizedBox(height: 12),
              
              TransactionItem(
                icon: Icons.shopping_bag,
                title: "Shopping",
                subtitle: "Amazon Store",
                amount: "NPR 5,240.00",
                isDebit: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## Color Recommendations

For transaction icon backgrounds, use these colors for visual variety:

```dart
// Debit transactions (expenses)
AppColors.error           // Red - for shopping, general expenses
Color(0xFFFF9800)        // Orange - for food/restaurant
Color(0xFF9C27B0)        // Purple - for fuel/transport
Color(0xFF2196F3)        // Blue - for utilities/recharge

// Credit transactions (income)
AppColors.success        // Green - for salary, income
Color(0xFF4CAF50)        // Light green - for refunds, cashback
```

---

## Best Practices

1. **Consistency**: Always use these common widgets instead of creating custom ones
2. **Spacing**: Use consistent spacing (8, 12, 16, 24 pixels) between elements
3. **Colors**: Use colors from `AppColors` class for consistency
4. **Icons**: Use Material Icons for consistency across the app
5. **Padding**: Wrap content in `PaddingProviderWidget` for consistent margins

---

## Tips

- For multi-line labels in FeatureButton, use `\n` in the label string
- Always provide meaningful onTap callbacks for better UX
- Use appropriate icon backgrounds to categorize transactions visually
- Keep transaction amounts formatted consistently (e.g., "NPR 1,234.00")
