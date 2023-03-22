import 'package:doctors/consts/colors.dart';
import 'package:doctors/data/specialist_doctors_data.dart';
import 'package:doctors/view/screens/home_screens/appointments_screen.dart';
import 'package:doctors/view/screens/home_screens/notification_screen.dart';
import 'package:doctors/view/screens/home_screens/search_screen.dart';
import 'package:doctors/view/widgets/home_screens_widgets/home_widgtes.dart';
import 'package:flutter/material.dart';

import '../../../data/doctors_info.dart';
import '../../widgets/costume_widgets.dart';
import 'doctor_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String d1Img =
      "https://media.istockphoto.com/id/1126789804/photo/doctor-with-digital-tablet-in-his-office.jpg?s=612x612&w=0&k=20&c=0qCW7xEjgg4gmOfiEicVUpmF_WQj0v9lZLo2YCdvtPc=";
  String d2Img =
      "https://media.istockphoto.com/id/1207212199/photo/youre-well-on-your-way-back-to-full-health.jpg?s=612x612&w=0&k=20&c=miBOM7fnv3W_DmJKSbv5szv8MdBav3bNyNGJUcoQmuk=";
  String d3Img =
      "https://media.istockphoto.com/id/1346124900/photo/confident-successful-mature-doctor-at-hospital.jpg?s=612x612&w=0&k=20&c=S93n5iTDVG3_kJ9euNNUKVl9pgXTOdVQcI_oDGG-QlE=";
  String d4Img =
      "https://media.istockphoto.com/id/1201439096/photo/male-medical-professional-is-confident-in-studio.jpg?s=612x612&w=0&k=20&c=T3a2ESMxG_cUVHvRxq4L0AKULnUPSpTR-qcBrce4h2I=";
  String d5Img =
      "https://media.istockphoto.com/id/1372002650/photo/cropped-portrait-of-an-attractive-young-female-doctor-standing-with-her-arms-folded-in-the.jpg?s=612x612&w=0&k=20&c=o1QtStNsowOU0HSof6xQ_jZMglU8ZK565gHd655U6S4=";
  String d6Img =
      "https://media.istockphoto.com/id/1161336374/photo/portrait-of-confident-young-medical-doctor-on-blue-background.jpg?s=612x612&w=0&k=20&c=zaa4MFrk76JzFKvn5AcYpsD8S0ePYYX_5wtuugCD3ig=";
  String d1Name = "DR.James M. Tollett";
  String d2Name = "DR.Thelma J. Jones";
  String d3Name = "DR.William M. Herman";
  String d4Name = "DR.Graham A. Bollinger";
  String d5Name = "DR.Paula L. Johnson";
  String d6Name = "DR.Kenny L. Brown";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Image.asset("images/logo.png"),
            title: const Text("Doctor Q"),
            centerTitle: false,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const NotificationScreen()));
                  },
                  icon: Icon(Icons.notifications, color: MyColors().blueColor)),
              IconButton(
                  onPressed: () {
                    favoriteScreen(size, context);
                  },
                  icon: Icon(Icons.favorite, color: MyColors().blueColor)),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.width * 0.05),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen()));
                    },
                    child: searchContainer(size)),
                SizedBox(height: size.width * 0.04),
                titles(
                    size: size, onTapSeeAll: () {}, title: 'Family Medicine'),
                SizedBox(height: size.width * 0.04),
                topDoctorsSection(size),
                SizedBox(height: size.width * 0.04),
                titles(
                    size: size, onTapSeeAll: () {}, title: 'Internal Medicine'),
                SizedBox(height: size.width * 0.04),
                topDoctorsSection(size),
                titles(size: size, onTapSeeAll: () {}, title: 'Pediatrician'),
                SizedBox(height: size.width * 0.04),
                topDoctorsSection(size),
                titles(size: size, onTapSeeAll: () {}, title: 'Cardiologist'),
                SizedBox(height: size.width * 0.04),
                topDoctorsSection(size),
                titles(size: size, onTapSeeAll: () {}, title: 'Oncologist'),
                SizedBox(height: size.width * 0.04),
                topDoctorsSection(size),
                titles(
                    size: size,
                    onTapSeeAll: () {},
                    title: 'Gastroenterologist'),
                SizedBox(height: size.width * 0.04),
                topDoctorsSection(size),
                titles(size: size, onTapSeeAll: () {}, title: 'Pulmonologist'),
                SizedBox(height: size.width * 0.04),
                topDoctorsSection(size),
                titles(
                    size: size,
                    onTapSeeAll: () {},
                    title: 'Infectious disease'),
                SizedBox(height: size.width * 0.04),
                topDoctorsSection(size),
                titles(size: size, onTapSeeAll: () {}, title: 'Nephrologist'),
                SizedBox(height: size.width * 0.04),
                topDoctorsSection(size),
                SizedBox(height: size.width * 0.04),
              ],
            ),
          )),
    );
  }

  Future<dynamic> favoriteScreen(Size size, BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(size.width * 0.05),
        topRight: Radius.circular(size.width * 0.05),
      )),
      context: context,
      builder: (context) {
        return Container(
          width: size.width,
          height: size.height * 1.0,
          decoration: BoxDecoration(
              color: MyColors().bottomSheetColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size.width * 0.05),
                topRight: Radius.circular(size.width * 0.05),
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.02),
                headerBottumSheet(size),
                SizedBox(height: size.height * 0.04),
                Text(
                  "Your favorite doctors",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(color: Colors.grey),
                SizedBox(height: size.height * 0.04),
                Expanded(
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 2 / 3),
                    shrinkWrap: true,
                    children: [
                      favoriteDoctorItem(
                          size: size,
                          doctorImg: d1Img,
                          doctorName: d1Name,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DoctorScreen(
                                        doctorName: d1Name,
                                        doctorImage: d1Img)));
                          }),
                      favoriteDoctorItem(
                          size: size,
                          doctorImg: d2Img,
                          doctorName: d2Name,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DoctorScreen(
                                        doctorName: d2Name,
                                        doctorImage: d2Img)));
                          }),
                      favoriteDoctorItem(
                          size: size,
                          doctorImg: d3Img,
                          doctorName: d3Name,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DoctorScreen(
                                        doctorName: d3Name,
                                        doctorImage: d3Img)));
                          }),
                      favoriteDoctorItem(
                          size: size,
                          doctorImg: d4Img,
                          doctorName: d4Name,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DoctorScreen(
                                        doctorName: d4Name,
                                        doctorImage: d4Img)));
                          }),
                      favoriteDoctorItem(
                          size: size,
                          doctorImg: d5Img,
                          doctorName: d5Name,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DoctorScreen(
                                        doctorName: d5Name,
                                        doctorImage: d5Img)));
                          }),
                      favoriteDoctorItem(
                          size: size,
                          doctorImg: d6Img,
                          doctorName: d6Name,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DoctorScreen(
                                        doctorName: d6Name,
                                        doctorImage: d6Img)));
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Column favoriteDoctorItem(
      {required Size size,
      required String doctorImg,
      required String doctorName,
      required Function() onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
            backgroundImage: NetworkImage(doctorImg),
            radius: size.width * 0.12,
          ),
        ),
        SizedBox(height: size.width * 0.03),
        Text(doctorName)
      ],
    );
  }
}
