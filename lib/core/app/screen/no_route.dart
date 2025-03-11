import 'package:ecommerce_app/core/constant/images_.dart';
import 'package:flutter/material.dart';

class NoRoute extends StatelessWidget {
  const NoRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(AppImges.pageUnderBulid),
          ),
        ),
      ),
    );
  }
}
