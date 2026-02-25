import 'package:flutter/material.dart';
import 'package:merova/src/core/enums/app_enum.dart';
import 'package:merova/src/core/extension/context_extensions.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/widget/header_positioned.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return AppBarBackground(
      title: tr.help,
      showBack: true,
      centerTitle: true,
      body: Stack(
        children: [
      BodyPositioned(
      child: Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),child:
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildHelpItem(
                  Icons.question_answer_outlined,
                  "FAQs",
                  "Commonly asked questions",
                ),
                _buildHelpItem(
                  Icons.headset_mic_outlined,
                  "Contact Us",
                  "Get in touch with our team",
                ),
                _buildHelpItem(
                  Icons.chat_bubble_outline_rounded,
                  "Live Chat",
                  "Chat with a representative",
                ),
              ],
            ),
          ),
      ),
      ),
        ],
      ),
    );
  }

  Widget _buildHelpItem(IconData icon, String title, String subtitle) {
    return Card(
      elevation: 0,
      color: Colors.grey.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () {},
      ),
    );
  }
}
