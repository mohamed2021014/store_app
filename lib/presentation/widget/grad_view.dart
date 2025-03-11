import 'package:ecommerce_app/core/Routes/app_routes.dart';
import 'package:ecommerce_app/core/constant/images_.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class Gridview extends StatelessWidget {
  const Gridview({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 2,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 220,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.prudicDetils);
          },
          child: Card(
            color: Colors.white,

            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Spacer(),
                      Icon(Icons.favorite_border, color: Colors.black),
                    ],
                  ),
                  Center(child: Image.asset(AppImges.sparParts, height: 80)),
                  SizedBox(height: 5),
                  Text(
                    "my name mohamed",
                    style: TextStyle(color: Colors.black),
                  ),
                  Row(
                    children: [
                      Text(
                        "${S.of(context).price} : 34 ",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "EGP",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 232, 138, 24),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromARGB(255, 55, 160, 247),
                        ),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
