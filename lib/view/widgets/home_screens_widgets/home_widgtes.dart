import 'package:doctors/view/screens/home_screens/doctor_screen.dart';
import 'package:doctors/view/widgets/costume_widgets.dart';
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
    height: size.height * 0.28,
    child: ListView.builder(
        itemCount: topDoctorsImages.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DoctorScreen(
                    doctorName: topDoctorsNames[index],
                    doctorImage: topDoctorsImages[index],
                  ),
                ),
              );
            },
            child: Container(
              width: size.width * 0.45,
              height: size.height,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(right: size.width * 0.03),
              padding: EdgeInsets.only(
                  top: size.width * 0.03, left: size.width * 0.03),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.05),
                  color: MyColors().canvasColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(topDoctorsImages[index]),
                        radius: size.width * 0.09,
                      ),
                      SizedBox(width: size.width * 0.06),
                      const Flexible(
                          child: Text(
                        "9:00AM To 20:00PM",
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.green,
                        ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(topDoctorsNames[index],style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.04
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star_half,
                          color: MyColors().blueColor, size: size.width * 0.06),
                      Text(
                        " 4.9",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  Container(
                    width: size.width,
                    height: size.height * 0.05,
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    margin: EdgeInsets.only(right: size.width * 0.03),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.05),
                      color:const Color(0xFF07203C),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const[
                        Text("View Profile"),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  )

                ],
              ),
            ),
          );
        }),
  );
}
