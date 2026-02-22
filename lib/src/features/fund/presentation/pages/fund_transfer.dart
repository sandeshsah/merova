import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:merova/src/core/widget/header_positioned.dart';


@RoutePage()
class FundTransferPage extends StatelessWidget {
  const FundTransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBarBackground(
      title: "Fund Transfer",
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
