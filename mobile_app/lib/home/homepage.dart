import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/colorPallete/color.dart';
import 'package:mobile_app/component/button_action.dart';
import 'package:mobile_app/home/wajah-terdaftar/face_registered.dart';
import 'package:mobile_app/home/wajah-tidak-terdaftar/face_not_registered.dart';

// netsh wlan show interface
// SSID : Lerr
// BSSID : 1e:81:c1:bc:e1:3c
// Password : satusampesembilan

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.kBackGroundedColors,
      appBar: AppBar(
        backgroundColor: GlobalColors.kYellowColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Smart Door Lock",
              style: GoogleFonts.poppins(
                color: GlobalColors.kBlackColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Vidio Visual ESP 32 - Cam",
                  style: GoogleFonts.poppins(
                    color: GlobalColors.kBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 220,
                  width: 380,
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    color: GlobalColors.kYellowColor,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                FaceRegistered()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalColors.kYellowColor,
                  ),
                  child: Text(
                    "Wajah Terdaftar",
                    style: GoogleFonts.poppins(
                      color: GlobalColors.kBlackColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 60),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                FaceNotRegistered()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalColors.kYellowColor,
                  ),
                  child: Text(
                    "Wajah Tak Terdaftar",
                    style: GoogleFonts.poppins(
                      color: GlobalColors.kBlackColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: ButtonAction(
              action: () {},
              name: "Buka",
              color: Colors.green,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ButtonAction(
              action: () {},
              name: "Tutup",
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
