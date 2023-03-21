import 'package:doctors/consts/colors.dart';
import 'package:doctors/data/specialist_doctors_data.dart';
import 'package:doctors/view/screens/home_screens/appointments_screen.dart';
import 'package:doctors/view/screens/home_screens/notification_screen.dart';
import 'package:doctors/view/screens/home_screens/search_screen.dart';
import 'package:doctors/view/widgets/home_screens_widgets/home_widgtes.dart';
import 'package:flutter/material.dart';

import '../../../data/doctors_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          title:const Text("Doctor Q"),
          centerTitle: false,
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const NotificationScreen()));
            }, icon: Icon(Icons.notifications,color: MyColors().blueColor)),
            IconButton(onPressed: (){

            }, icon: Icon(Icons.favorite,color: MyColors().blueColor)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.width * 0.05),
              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchScreen()));
                  },
                  child: searchContainer(size)),
              SizedBox(height: size.width * 0.04),
              titles(size: size, onTapSeeAll: () {  }, title: 'Family Medicine'),
              SizedBox(height: size.width * 0.04),
              topDoctorsSection(size),
              SizedBox(height: size.width * 0.04),
              titles(size: size, onTapSeeAll: () {  }, title: 'Internal Medicine'),
              SizedBox(height: size.width * 0.04),
              topDoctorsSection(size),
              titles(size: size, onTapSeeAll: () {  }, title: 'Pediatrician'),
              SizedBox(height: size.width * 0.04),
              topDoctorsSection(size),
              titles(size: size, onTapSeeAll: () {  }, title: 'Cardiologist'),
              SizedBox(height: size.width * 0.04),
              topDoctorsSection(size),
              titles(size: size, onTapSeeAll: () {  }, title: 'Oncologist'),
              SizedBox(height: size.width * 0.04),
              topDoctorsSection(size),
              titles(size: size, onTapSeeAll: () {  }, title: 'Gastroenterologist'),
              SizedBox(height: size.width * 0.04),
              topDoctorsSection(size),
              titles(size: size, onTapSeeAll: () {  }, title: 'Pulmonologist'),
              SizedBox(height: size.width * 0.04),
              topDoctorsSection(size),
              titles(size: size, onTapSeeAll: () {  }, title: 'Infectious disease'),
              SizedBox(height: size.width * 0.04),
              topDoctorsSection(size),
              titles(size: size, onTapSeeAll: () {  }, title: 'Nephrologist'),
              SizedBox(height: size.width * 0.04),
              topDoctorsSection(size),
              SizedBox(height: size.width * 0.04),
            ],
          ),
        )
      ),
    );
  }
}
