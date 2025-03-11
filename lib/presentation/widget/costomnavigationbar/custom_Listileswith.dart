import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Listileswiith extends StatelessWidget {
  Widget? leading;
  bool value;
  void Function(bool)? onChanged;
  String textt;
  Listileswiith({
    super.key,
    this.leading,
    required this.value,
    required this.textt,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      trailing: SizedBox(
        width: 20,

        child: Switch(value: value, onChanged: onChanged),
      ),
      title: Text(
        textt,
        style: GoogleFonts.abhayaLibre(
          textStyle: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
