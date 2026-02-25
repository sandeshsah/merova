import 'package:flutter/material.dart';
import 'package:merova/src/core/extension/context_extensions.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/service/security_service.dart';
import 'package:merova/src/init_dependencies.dart';
import 'package:merova/src/core/widget/header_positioned.dart';
import 'package:merova/src/core/widget/biometric_sheet.dart';
import 'package:pinput/pinput.dart';

class BiometricSettingsPage extends StatefulWidget {
  const BiometricSettingsPage({super.key});

  @override
  State<BiometricSettingsPage> createState() => _BiometricSettingsPageState();
}

class _BiometricSettingsPageState extends State<BiometricSettingsPage> {
  final _securityService = sl<SecurityService>();
  bool _isBiometricSupported = false;

  @override
  void initState() {
    super.initState();
    _checkSupport();
  }

  Future<void> _checkSupport() async {
    final supported = await _securityService.canCheckBiometrics();
    setState(() {
      _isBiometricSupported = supported;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return AppBarBackground(
      title: tr.biometricSetting,
      showBack: true,
      centerTitle: true,
      body: Stack(
        children: [
          BodyPositioned(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(20),
                      children: [
                        _buildSectionHeader("BIOMETRIC AUTHENTICATION"),
                        _buildToggleItem(
                          icon: Icons.fingerprint,
                          title: "Biometric Login",
                          subtitle: "Use fingerprint/face to login",
                          value: _securityService.isBiometricLoginEnabled(),
                          enabled: _isBiometricSupported,
                          onChanged: (val) async {
                            if (val) {
                              final authenticated =
                                  await BiometricSheet.authenticatedBiometric(
                                    context,
                                    reason:
                                        "Confirm identity to enable Biometric Login",
                                  );
                              if (authenticated) {
                                await _securityService.enableBiometricLogin(
                                  true,
                                );
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Biometric Login enabled. Please login manually once to complete setup.",
                                      ),
                                    ),
                                  );
                                }
                                setState(() {});
                              }
                            } else {
                              await _securityService.enableBiometricLogin(
                                false,
                              );
                              setState(() {});
                            }
                          },
                        ),
                        const SizedBox(height: 12),
                        _buildToggleItem(
                          icon: Icons.payments_outlined,
                          title: "Biometric Transaction",
                          subtitle: "Use biometrics for money transfers",
                          value: _securityService
                              .isBiometricTransactionEnabled(),
                          enabled: _isBiometricSupported,
                          onChanged: (val) async {
                            if (val) {
                              final authenticated =
                                  await BiometricSheet.authenticatedBiometric(
                                    context,
                                    reason:
                                        "Confirm identity to enable Biometric Transactions",
                                  );
                              if (authenticated) {
                                await _securityService
                                    .enableBiometricTransaction(true);
                                setState(() {});
                              }
                            } else {
                              await _securityService.enableBiometricTransaction(
                                false,
                              );
                              setState(() {});
                            }
                          },
                        ),
                        const SizedBox(height: 24),
                        _buildSectionHeader("TRANSACTION PIN"),
                        _buildActionItem(
                          icon: Icons.dialpad,
                          title: _securityService.isTransactionPinEnabled()
                              ? "Change Transaction PIN"
                              : "Setup Transaction PIN",
                          subtitle: "Alternative security for transfers",
                          onTap: () => _showPinSetup(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildToggleItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required bool enabled,
    required Function(bool) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: enabled ? AppColors.white : Colors.grey.shade50,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: Icon(
              icon,
              size: 24,
              color: enabled ? Colors.blue : Colors.grey,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  enabled ? subtitle : "Not supported on this device",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
          ),
          Switch.adaptive(
            value: value,
            onChanged: enabled ? onChanged : null,
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade100),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 24, color: Colors.blue),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  void _showPinSetup(BuildContext context) {
    final controller = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Setup Transaction PIN",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Enter a 4-digit PIN for secure transactions",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 48),
            Pinput(
              length: 4,
              controller: controller,
              obscureText: true,
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
              ),
              onCompleted: (pin) async {
                await _securityService.saveTransactionPin(pin);
                if (mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Transaction PIN saved successfully"),
                    ),
                  );
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
