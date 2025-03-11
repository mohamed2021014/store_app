import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carculslide extends StatefulWidget {
  const Carculslide({super.key});

  @override
  State<Carculslide> createState() => _CarculslideState();
}

class _CarculslideState extends State<Carculslide> {
  List<Widget> contaner = [
    Container(
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage('assets/images/ppf-coverage.jpg'),
        ),
      ),
    ),
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/diesel_torque_enhancement_through_remapping.jpg',
          ),
          fit: BoxFit.fill,
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage(
            'assets/images/minimalist-car-repair-logo-design-template-car-repair-service-logo-vector.jpg',
          ),
        ),
      ),
    ),
  ];
  int activeindrx = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
      child: CarouselSlider.builder(
        itemCount: contaner.length,

        itemBuilder: (context, index, realIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              child: contaner[index],
            ),
          );
        },
        options: CarouselOptions(
          onPageChanged: (index, reason) {
            activeindrx = index;
            setState(() {});
          },
          reverse: true,
          autoPlay: true,
          height: 100,
          viewportFraction: 1,
        ),
      ),
    );
  }
}
