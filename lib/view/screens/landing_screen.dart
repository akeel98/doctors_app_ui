import 'package:flutter/material.dart';

import '../../consts/colors.dart';
import '../widgets/costume_widgets.dart';
import 'auth_screens/sign_up.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          Hero(
            tag: "logo",
            child: Image.asset("images/logo.png",
              height: size.width * 0.5,
              width: size.width * 0.5,
            ),
          ),
          const Expanded(child: SizedBox()),
          Text(
            "Welcome to doctors",
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.05,
            ),
          ),
          SizedBox(height: size.height * 0.05),
          costumeButton(
              size: size,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const SignUpScreen()));
              },
              title: 'Sign up',
          ),
          SizedBox(height: size.height * 0.01),
          InkWell(
            onTap:(){},
            child: Container(
              width: double.infinity,
              height: size.height * 0.065,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              decoration: BoxDecoration(
                  border: Border.all(color: MyColors().buttonsColor),
                  borderRadius: BorderRadius.circular(size.width * 0.05)),
              child: Text("Sign in",
                style: TextStyle(
                  color: MyColors().buttonsColor,
                  fontSize: size.width * 0.05,
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
        ],
      ),
    );
  }
}
