import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:merova/src/core/enums/app_enum.dart';
import 'package:merova/src/core/extension/context_extensions.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/widget/header_positioned.dart';
import 'package:merova/src/core/routes/app_router.dart';
import 'package:merova/src/features/personalInformation/presentation/pages/personal_info_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merova/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:merova/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:merova/src/features/auth/presentation/bloc/auth_state.dart';
import 'package:merova/src/core/constants/storage_keys.dart';

import 'sections/terms_conditions_page.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  String fullName = "";
  String email = "";
  String phone = "";

  @override
  void initState() {
    super.initState();
    _loadUserData();
    final authState = context.read<AuthBloc>().state;
    if (authState.user != null) {
      setState(() {
        if (authState.user!.email.isNotEmpty) {
          email = authState.user!.email;
        }
      });
    }
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();

    if (mounted) {
      setState(() {
        fullName = prefs.getString(StorageKeys.fullName) ?? "";
        email = prefs.getString(StorageKeys.userEmail) ?? "";
        phone = prefs.getString(StorageKeys.phoneNumber) ?? "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status.isUnauthenticated) {
          context.router.replaceAll([const LoginRoute()]);
        } else if (state.user != null) {
          setState(() {
            if (state.user!.fullName.isNotEmpty) {
              fullName = state.user!.fullName;
            }
            if (state.user!.email.isNotEmpty) {
              email = state.user!.email;
            }
          });
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            HeaderPositioned(
              title: tr.profile,
              alignment: HeaderAlignment.center,
            ),
            Expanded(child: _content(context)),
          ],
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 70, 20, 100),
            children: [
              _sectionHeader("Reward"),
              _settingsGroup([
                _settingItem(icon: Icons.star, title: "Reward", onTap: () {}),
              ]),
              const SizedBox(height: 24),
              _sectionHeader("Personal Setting"),
              _settingsGroup([
                _settingItem(
                  icon: Icons.person_outline_rounded,
                  title: "Personal Information",
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PersonalInfoPage(),
                    ),
                    );
                  },
                ),
                _separator(),
                _settingItem(
                  icon: Icons.tablet_android_rounded,
                  title: "Device Management",
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const DeviceManagementPage(),
                    //   ),
                    // );
                  },
                ),
                _separator(),
                _settingItem(
                  icon: Icons.notifications_none_rounded,
                  title: "Notifications",
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const NotificationsPage(),
                    //   ),
                    // );
                  },
                ),
              ]),
              const SizedBox(height: 24),
              _sectionHeader("SECURITY & PRIVACY"),
              _settingsGroup([
                _separator(),
                _settingItem(
                  icon: Icons.lock_outline,
                  title: "Change password",
                ),
                _separator(),
                _settingItem(icon: Icons.fingerprint, title: "Use Biometric"),
                _settingItem(
                  icon: Icons.shield_outlined,
                  title: "Privacy Policy",
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const PrivacySettingsPage(),
                    //   ),
                    // );
                  },
                ),
                _separator(),
                _settingItem(
                  icon: Icons.assignment_outlined,
                  title: "Term & Condition",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermsConditionsPage(),
                      ),
                    );
                  },
                ),
              ]),
              const SizedBox(height: 24),
              _sectionHeader("ABOUT"),
              _settingsGroup([
                _settingItem(
                  icon: Icons.info_outline_rounded,
                  title: "About App",
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const AboutAppPage(),
                    //   ),
                    // );
                  },
                ),
                _separator(),
                _settingItem(icon: Icons.help_center, title: "Help"),
              ]),
              const SizedBox(height: 32),
              _signOutButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
        // Overlapping Profile Card
        Positioned(
          top: -40,
          left: 20,
          right: 20,
          child: _profileCard(
            context: context,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const PersonalInfoPage(),
              //   ),
              //);
            },
          ),
        ),
      ],
    );
  }

  Widget _profileCard({required BuildContext context, VoidCallback? onTap}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_rounded,
                  size: 32,
                  color: Colors.grey.shade500,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullName.isEmpty ? "Merova User" : fullName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email.isEmpty ? " " : email,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _settingsGroup(List<Widget> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: items),
    );
  }

  Widget _settingItem({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 22, color: Colors.grey.shade700),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff334155),
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }

  Widget _separator() {
    return Divider(
      height: 1,
      thickness: 1,
      indent: 54,
      endIndent: 16,
      color: Colors.grey.shade50,
    );
  }

  Widget _signOutButton() {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xffFFF5F5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffFFE5E5)),
      ),
      child: InkWell(
        onTap: () {
          context.read<AuthBloc>().add(const AuthEvent.logoutRequested());
        },
        borderRadius: BorderRadius.circular(16),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.logout_rounded, color: Colors.redAccent, size: 20),
              SizedBox(width: 8),
              Text(
                "Sign Out",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
