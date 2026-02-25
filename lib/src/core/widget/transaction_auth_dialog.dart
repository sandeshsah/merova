import 'package:flutter/material.dart';
import 'package:merova/src/core/service/security_service.dart';
import 'package:merova/src/init_dependencies.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:pinput/pinput.dart';

class TransactionAuthDialog extends StatefulWidget {
  final String amount;
  final Function(bool) onResult;

  const TransactionAuthDialog({
    super.key,
    required this.amount,
    required this.onResult,
  });

  @override
  State<TransactionAuthDialog> createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final _securityService = sl<SecurityService>();
  bool _usePin = false;

  @override
  void initState() {
    super.initState();
    if (_securityService.isBiometricTransactionEnabled()) {
      _authenticateBiometric();
    } else {
      _usePin = true;
    }
  }

  Future<void> _authenticateBiometric() async {
    final success = await _securityService.authenticateBiometric(
      reason: "Authorize payment of ${widget.amount}",
    );
    if (success) {
      widget.onResult(true);
    } else {
      setState(() {
        _usePin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Authorize Transaction",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Amount: ${widget.amount}",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            if (_usePin) ...[
              const Text("Enter Transaction PIN"),
              const SizedBox(height: 16),
              Pinput(
                length: 4,
                obscureText: true,
                onCompleted: (pin) async {
                  final valid = await _securityService.verifyTransactionPin(
                    pin,
                  );
                  if (valid) {
                    widget.onResult(true);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Invalid PIN")),
                    );
                  }
                },
              ),
            ] else ...[
              const Icon(Icons.fingerprint, size: 60, color: Colors.blue),
              const SizedBox(height: 16),
              const Text("Touch the fingerprint sensor"),
            ],
            const SizedBox(height: 24),
            TextButton(
              onPressed: () => widget.onResult(false),
              child: const Text("CANCEL", style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
