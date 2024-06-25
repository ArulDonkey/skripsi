import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/colorPallete/color.dart';
import 'package:mobile_app/home/homepage.dart';

class FaceRegistered extends StatefulWidget {
  const FaceRegistered({super.key});

  @override
  State<FaceRegistered> createState() => _FaceRegisteredState();
}

class _FaceRegisteredState extends State<FaceRegistered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColors.kYellowColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MyHomePage()));
              },
              icon: Icon(
                Icons.home,
                color: GlobalColors.kBlackColor,
              ),
            ),
            // SizedBox(width: 80),
            Text(
              "Wajah Terdaftar",
              style: GoogleFonts.poppins(
                color: GlobalColors.kBlackColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
