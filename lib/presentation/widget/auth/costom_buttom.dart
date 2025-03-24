import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtomAuth extends StatelessWidget {
  final Widget text;
  final void Function()? onPressed;
  void Function()? onTap;
  final Widget widgett;
  CustomButtomAuth({
    super.key,
    required this.text,
    this.onPressed,
    this.onTap,
    required this.widgett,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 20, 104, 248),
              Colors.lightBlueAccent,
            ],
          ),
        ),
        margin: const EdgeInsets.only(top: 10),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 13),
          onPressed: onPressed,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [text, widgett],
          ),
        ),
      ),
    );
  }
}
