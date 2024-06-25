import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/colorPallete/color.dart';
import 'package:mobile_app/home/homepage.dart';

class FaceNotRegistered extends StatefulWidget {
  const FaceNotRegistered({super.key});

  @override
  State<FaceNotRegistered> createState() => _FaceNotRegisteredState();
}

class _FaceNotRegisteredState extends State<FaceNotRegistered> {
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
                    builder: (BuildContext context) => MyHomePage(),
                  ),
                );
              },
              icon: Icon(
                Icons.home,
                color: GlobalColors.kBlackColor,
              ),
            ),
            Text(
              "Wajah Tidak Terdaftar",
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
