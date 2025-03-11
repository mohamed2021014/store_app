import 'package:flutter/material.dart';

Container cardCatogris(
  BuildContext context, {
  required String image,
  required String text,
  color,
}) {
  return Container(
    margin: const EdgeInsets.only(left: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.black),
    ),
    child: Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: Image.asset(
                image,
                //   color: Colors.black,
                color: color,
              ),
            ),
            SizedBox(height: 5),
            Text(text, style: Theme.of(context).textTheme.displaySmall),
          ],
        ),
      ),
    ),
  );
}
