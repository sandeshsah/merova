import 'package:flutter/material.dart';
import 'package:merova/src/core/enums/app_enum.dart';
import 'package:merova/src/core/themes/app_colors.dart';
import 'package:merova/src/core/themes/app_text_styles.dart';

class HeaderPositioned extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String? image;
  final HeaderAlignment alignment;

  const HeaderPositioned({
    super.key,
    required this.title,
    this.subtitle,
    this.alignment = HeaderAlignment.center,
    this.image,
  });

  @override
  State<HeaderPositioned> createState() => _HeaderPositionedState();
}

class _HeaderPositionedState extends State<HeaderPositioned> {
  @override
  Widget build(BuildContext context) {
    final bool isCenter = widget.alignment == HeaderAlignment.center;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.85),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment:
        isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            textAlign: isCenter ? TextAlign.center : TextAlign.start,
            style: AppTextStyles.headline1

          ),
          if (widget.subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              widget.subtitle!,
              textAlign: isCenter ? TextAlign.center : TextAlign.start,
              style: AppTextStyles.headline2
            ),
          ],
        ],
      ),
    );
  }
}

class AppBarBackground extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget body;
  final bool showBack;
  final VoidCallback? onBack;

  const AppBarBackground({
    super.key,
    required this.title,
    required this.body,
    this.subtitle,
    this.showBack = true,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        centerTitle: false, // better for title + subtitle
        leading: showBack
            ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack ?? () => Navigator.pop(context),
        )
            : null,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.white
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(
                subtitle!,
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.white,fontWeight: FontWeight.bold
                ),
              ),
            ],
          ],
        ),
      ),
      body: body,
    );
  }
}

class BodyPositioned extends StatelessWidget {
  final Widget child;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double? height;
  final double? width;
  const BodyPositioned({
    super.key,
    required this.child,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.height,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    return  Positioned(
        top: 120,
        bottom: 0,
        left: 0,
        right: 0,
        height: height,
        width: width,
        child: child,
    );
  }
}
