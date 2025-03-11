import 'package:ecommerce_app/core/constant/images_.dart';
import 'package:ecommerce_app/presentation/page/auth/login.dart';
import 'package:ecommerce_app/presentation/page/auth/sinup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class Onbording extends StatelessWidget {
  final Color kDarkBlueColor = const Color.fromARGB(255, 49, 134, 231);

  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Group 42.png'),
          ),
        ),
        child: OnBoardingSlider(
          finishButtonText: 'Register',
          onFinish: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => SinUp()),
              (route) => false,
            );
          },
          finishButtonStyle: FinishButtonStyle(backgroundColor: kDarkBlueColor),
          skipTextButton: Text(
            'Skip',
            style: TextStyle(
              fontSize: 16,
              color: kDarkBlueColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Text(
            'Login',
            style: TextStyle(
              fontSize: 16,
              color: kDarkBlueColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailingFunction: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Login()),
              (route) => false,
            );
          },
          controllerColor: kDarkBlueColor,
          totalPage: 3,
          headerBackgroundColor: Colors.white,
          pageBackgroundColor: Colors.white,
          background: [
            Image.asset(AppImges.enpording1, height: 420),
            Image.asset(AppImges.enpording2, height: 400),
            Image.asset(AppImges.enpording3, height: 370),
          ],
          speed: 1.8,
          pageBodies: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 480),
                  Text(
                    'On your way...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'to find the perfect looking Onboarding for your app?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 480),
                  Text(
                    'You’ve reached your destination.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Sliding with animation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 480),
                  Text(
                    'Start now!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Where everything is possible and customize your onboarding.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
