import 'package:ecommerce_app/core/constant/app_lotti.dart';
import 'package:ecommerce_app/core/constant/images_.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:ecommerce_app/presentation/widget/catocare_contanir.dart';
import 'package:ecommerce_app/presentation/widget/grad_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ecommerce_app/presentation/widget/carcul_slide.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Carculslide(),
              Center(child: Lottie.asset(AppLotti.home, height: 100)),
              Text(
                S.of(context).Sections,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 5),

              //                                       ==================Catogari ==========================
              Row(
                children: [
                  cardCatogris(
                    context,
                    image: AppImges.sparParts,
                    text: S.of(context).Parts,
                  ),
                  cardCatogris(
                    color: const Color.fromARGB(255, 91, 91, 91),
                    context,
                    image: AppImges.screen,
                    text: S.of(context).screens,
                  ),
                  InkWell(
                    onTap: () {},
                    child: cardCatogris(
                      context,
                      image: AppImges.carcare,
                      text: S.of(context).Car_Care,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),
              Text(
                S.of(context).best_seller,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              //                                                 ==========gradView===========
              Gridview(),
            ],
          ),
        ),
      ),
    );
  }
}
