import 'package:doctors/view/screens/on_boarding/on_boarding_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../widgets/costume_widgets.dart';
import '../landing_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                isLast = index == 2;
              });
            },
            children: const [
              OnBoardingDetailsScreen(
                image: "images/onBoardingImages/doc1.jpg",
                title: "Thousands of doctors",
                description:
                    "You can easily contact with a thousands of doctors and contact for your need",
              ),
              OnBoardingDetailsScreen(
                image: "images/onBoardingImages/doc2.jpg",
                title: "Chat with doctors",
                description:
                    "Book an appointment with doctor. chat with doctor via appointment letter and get consultation",
              ),
              OnBoardingDetailsScreen(
                image: "images/onBoardingImages/doc3.jpg",
                title: "Live talk with doctor",
                description:
                    "Easily connect with doctor, start voice and video call for your better treatment & prescription",
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  axisDirection: Axis.horizontal,
                  effect: SlideEffect(
                    spacing: 8.0,
                    radius: size.width * 0.7,
                    dotWidth: size.width * 0.04,
                    dotHeight: size.width * 0.04,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 1.5,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.indigo,
                  ),
                ),
                SizedBox(height: size.width * 0.04),
                TextButton(
                  onPressed: () {
                    controller.animateToPage(2,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeIn);
                  },
                  child: const Text("Skip"),
                ),
                SizedBox(height: size.width * 0.04),
                isLast
                    ? costumeButton(
                        size: size,
                        title: "Get started",
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>const LandingScreen()));
                        })
                    : costumeButton(
                        size: size,
                        title: "Next",
                        onPressed: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 700),
                              curve: Curves.easeIn);
                        }),
                SizedBox(height: size.width * 0.04),
              ],
            ),
          )
        ],
      ),
    );
  }
}
