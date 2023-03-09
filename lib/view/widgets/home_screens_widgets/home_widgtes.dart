import 'package:flutter/material.dart';

import '../../../consts/colors.dart';
import '../../../data/doctors_info.dart';
import '../../../data/specialist_doctors_data.dart';

Container searchContainer(Size size) {
  return Container(
    width: size.width,
    height: size.height * 0.07,
    padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
    decoration: BoxDecoration(
        color: MyColors().canvasColor,
        borderRadius: BorderRadius.circular(size.width * 0.05)),
    child: Row(
      children: [
        Text(
          "Search",
          style: TextStyle(color: MyColors().hintsColor),
        ),
        const Expanded(child: SizedBox()),
        Icon(Icons.search, color: MyColors().hintsColor)
      ],
    ),
  );
}

Row titles(
    {required Size size,
    required String title,
    required VoidCallback onTapSeeAll}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
            fontSize: size.width * 0.045, fontWeight: FontWeight.w600),
      ),
      TextButton(onPressed: onTapSeeAll, child: const Text("See all"))
    ],
  );
}

SizedBox specialistDoctorsSection(Size size) {
  return SizedBox(
    width: size.width,
    height: size.height * 0.2,
    child: ListView.builder(
        itemCount: specialistDoctors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
              width: size.width * 0.28,
              height: size.height,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: size.width * 0.02),
              decoration: BoxDecoration(
                  color: MyColors().homeColors[index],
                  borderRadius: BorderRadius.circular(size.width * 0.05)),
              child: Text(
                specialistDoctors[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: MyColors().homeColors[index] == Colors.yellow
                      ? Colors.black
                      : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ));
        }),
  );
}

SizedBox topDoctorsSection(Size size) {
  return SizedBox(
    width: size.width,
    height: size.height * 0.35,
    child: ListView.builder(
        itemCount: topDoctorsImages.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: size.width * 0.45,
            height: size.height,
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(right: size.width * 0.03),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * 0.05),
                image: DecorationImage(
                  image: NetworkImage(topDoctorsImages[index]),
                  fit: BoxFit.fill,
                ),
            ),
            child: Container(
              width: size.width,
              height: size.height * 0.09,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:const Color(0xFF252525),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(size.width * 0.05),
                  bottomRight: Radius.circular(size.width * 0.05),
                )
              ),
              child: Text(topDoctorsNames[index],style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.04
              ),),
            ),
          );
        }),
  );
}
