import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:merova/src/core/widget/header_positioned.dart';

@RoutePage()
class PaymentPages extends StatelessWidget {
  const PaymentPages({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarBackground(
      title: "Payment",
      centerTitle: true ,
      body: Stack(
        children: [
          BodyPositioned(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
            ),
          ),
          ),
        ]
      ),
    );
  }
}
