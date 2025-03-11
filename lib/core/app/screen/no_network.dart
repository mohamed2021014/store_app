import 'package:ecommerce_app/core/constant/images_.dart';
import 'package:flutter/material.dart';

class NoNetwork extends StatelessWidget {
  const NoNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImges.noNetworkImages),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const Text('No Network', style: TextStyle(fontSize: 22)),
        ],
      ),
    );
  }
}
