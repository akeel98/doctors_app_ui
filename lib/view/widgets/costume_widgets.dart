import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../../consts/colors.dart';

InkWell costumeButton(
    {required Size size,
    required VoidCallback onPressed,
    required String title}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: double.infinity,
      height: size.height * 0.065,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      decoration: BoxDecoration(
          color: MyColors().buttonsColor,
          borderRadius: BorderRadius.circular(size.width * 0.05)),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: size.width * 0.05,
        ),
      ),
    ),
  );
}

InputDecoration formFieldDecoration(Size size) {
  return InputDecoration(
    fillColor: const Color(0xFF141414),
    filled: true,
    hintStyle: TextStyle(
      color: MyColors().hintsColor,
      fontWeight: FontWeight.bold,
    ),
    disabledBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(size.width * 0.05),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(size.width * 0.05),
    ),
  );
}

Container continueWith(
    {required Size size, required String image, required String text}) {
  return Container(
    width: size.width * 0.4,
    height: size.height * 0.09,
    decoration: BoxDecoration(
        color: const Color(0xFF141414),
        borderRadius: BorderRadius.circular(size.width * 0.05)),
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CircleAvatar(
        backgroundImage: AssetImage(image),
      ),
      SizedBox(width: size.width * 0.02),
      Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: size.width * 0.04,
        ),
      )
    ]),
  );
}

Container headerBottumSheet(Size size) {
  return Container(
    width: size.width * 0.1,
    height: size.height * 0.005,
    decoration: BoxDecoration(
        color: MyColors().hintsColor,
        borderRadius: BorderRadius.circular(size.width * 0.1)),
  );
}
