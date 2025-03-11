import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget newMethod() {
  return AppBar(
    elevation: 8,
    shadowColor: Colors.black,
    // leading: IconButton(onPressed: () {}, icon: Icon(Icons.view_list)),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [
            Color.fromARGB(255, 16, 0, 247),

            Color.fromARGB(255, 85, 151, 244),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    centerTitle: true,

    title: Text(
      "Auoto Express",
      style: GoogleFonts.abyssinicaSil(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),

    actions: [
      InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.search),
        ),
      ),
    ],
  );
}
