import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtomAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  void Function()? onTap;
  CustomButtomAuth({super.key, required this.text, this.onPressed, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
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
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Icon(Icons.arrow_right_alt_rounded, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
