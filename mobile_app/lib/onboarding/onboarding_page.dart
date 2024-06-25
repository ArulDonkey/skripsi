import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/colorPallete/color.dart';
import 'package:mobile_app/home/homepage.dart';
import 'package:mobile_app/utils/sharePreferensi.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pageController = PageController(initialPage: 0);
  final iniSharedPreferences _preferences = iniSharedPreferences();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: demo_data.length,
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: (context, index) => Stack(
            alignment: AlignmentDirectional.center,
            children: [
              PageContent(
                image: demo_data[index].images,
                title: demo_data[index].titles,
                description: demo_data[index].descriptions,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 680),
                child: _buildButton(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton() {
    return Column(
      children: [
        _currentPage == demo_data.length - 1
            ? MyTextButton(
                buttonName: 'Mulai',
                onPressed: () {
                  _preferences.setFirsLaunchValue(false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => MyHomePage(),
                    ),
                  );
                },
                bgColor: GlobalColors.kYellowColor,
              )
            : Column(
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: WormEffect(
                      dotColor: GlobalColors.kBlackColor,
                      activeDotColor: GlobalColors.kYellowColor,
                      dotHeight: 10,
                      dotWidth: 10,
                      type: WormType.thinUnderground,
                    ),
                  ),
                ],
              )
      ],
    );
  }
}

class Onboard {
  final String images, titles, descriptions;

  Onboard({
    required this.images,
    required this.titles,
    required this.descriptions,
  });
}

final List<Onboard> demo_data = [
  Onboard(
    images: 'assets/image/onboarding_1.png',
    titles: 'Smart Door Lock',
    descriptions: 'Sistem pengamanan ganda untuk pintu\nrumah',
  ),
  Onboard(
    images: 'assets/image/onboarding_2.png',
    titles: 'Cloud',
    descriptions: 'Menyimpan gambar setiap pengguna\nyang memasuki pintu rumah',
  ),
  Onboard(
    images: 'assets/image/onboarding_3.png',
    titles: 'Controller',
    descriptions:
        'Sistem akan mengirimkan gambar\npengguna yang akan masuk kerumah\nbeserta keterangan dikenali atau tidak',
  ),
];

class PageContent extends StatelessWidget {
  const PageContent(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            alignment: Alignment.center,
            height: 263,
            width: 261,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: GlobalColors.kBlackColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            description,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: GlobalColors.kBlackColor,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.bgColor,
  }) : super(key: key);

  final String buttonName;
  final VoidCallback onPressed;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonName,
                  style: GoogleFonts.poppins(
                    color: GlobalColors.kBlackColor,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: GlobalColors.kYellowColor,
              side: BorderSide(width: 2, color: GlobalColors.kBlackColor),
              padding: EdgeInsets.all(10.0),
              fixedSize: Size(150, 10),
              textStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: GlobalColors.kBlackColor,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
