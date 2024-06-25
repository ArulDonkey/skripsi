import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/colorPallete/color.dart';

class ButtonAction extends StatelessWidget {
  const ButtonAction(
      {super.key,
      required this.action,
      required this.name,
      required this.color});
  final String name;
  final VoidCallback action;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        width: 66,
        height: 36,
        color: color,
        child: Center(
          child: Text(
            name,
            style: GoogleFonts.poppins(
              color: GlobalColors.kBackGroundedColors,
            ),
          ),
        ),
      ),
    );
  }
}
