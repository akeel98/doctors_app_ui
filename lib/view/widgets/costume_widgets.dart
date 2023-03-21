import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import '../../consts/colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';


costumeSnackBar({required String content, required size, required context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size.width * 0.05),
      ),
      backgroundColor: MyColors().blueColor,
      content: Text(content,style: const TextStyle(
        color: Colors.white
        ),
      ),
    ),
  );
}

awesomeDialog({
  required context,
  required String title,
  required String desc,
  required Function() okBtn,
  required Function() cancelBtn,
}) {
  AwesomeDialog(
    context: context,
    dialogBackgroundColor: const Color(0xFF242424),
    dismissOnTouchOutside: false,
    autoDismiss: true,
    dialogType: DialogType.info,
    animType: AnimType.rightSlide,
    title: title,
    desc: desc,
    btnCancelOnPress: cancelBtn,
    btnOkOnPress: okBtn,
  ).show();
}

InkWell costumeButton({required Size size,
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

SizedBox costumeCalender(Size size) {
  return SizedBox(
    width: size.width,
    height: size.height * 0.2,
    child: CalendarTimeline(
      initialDate: DateTime(2023, 4, 1),
      firstDate: DateTime(2023, 1, 1),
      lastDate: DateTime(2024, 1, 1),
      onDateSelected: (date) => print(date),
      leftMargin: 20,
      monthColor: Colors.blueGrey,
      dayColor: Colors.teal[200],
      activeDayColor: Colors.white,
      activeBackgroundDayColor: MyColors().blueColor,
      dotsColor: const Color(0xFF333A47),
      selectableDayPredicate: (date) => date.day != 23,
      locale: 'en_ISO',
    ),
  );
}
