import 'package:flutter/material.dart';

import '../../../consts/colors.dart';

class OnBoardingDetailsScreen extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  const OnBoardingDetailsScreen({ required this.image,required this.title,required this.description,Key? key}) : super(key: key);

  @override
  State<OnBoardingDetailsScreen> createState() =>
      _OnBoardingDetailsScreenState();
}

class _OnBoardingDetailsScreenState extends State<OnBoardingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
          ),
          //doctor image
          Container(
            width: double.infinity,
            height: size.height * 0.6,
            decoration:  BoxDecoration(
                image: DecorationImage(
              image: AssetImage(widget.image),
              fit: BoxFit.cover,
            )),
          ),
          //title and description container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: size.height * 0.45,
              padding: EdgeInsets.only(top: size.width * 0.02),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(size.height * 0.05),
                    topRight: Radius.circular(size.height * 0.05),
                  ),
                  color: MyColors().mainColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //grey thing in the top of the container
                  Container(
                    width: size.width * 0.1,
                    height: size.width * 0.01,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(size.width * 0.05)
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Text(widget.title,
                    style: TextStyle(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.bold,
                      color: MyColors().blueColor,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Text(widget.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}
