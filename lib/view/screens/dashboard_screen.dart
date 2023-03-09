import 'package:doctors/consts/colors.dart';
import 'package:doctors/view/screens/home_screens/home_screen.dart';
import 'package:doctors/view/screens/home_screens/notification_screen.dart';
import 'package:doctors/view/screens/profil_screens/profile_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int index = 0;
  List pages = [
    const HomeScreen(),
    Text("Appointment Screen"),
    const NotificationScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(size.width * 0.06),
          topRight: Radius.circular(size.width * 0.06),
        ),
        child: BottomNavigationBar(
          selectedItemColor: MyColors().blueColor,
          showUnselectedLabels: false,
          currentIndex: index,
          onTap: (val){
            setState(() {
              index = val;
            });
          },
          items: const[
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.list_outlined),label: "Appointment"),
            BottomNavigationBarItem(icon: Icon(Icons.notifications),label: "Notifications"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
          ],
        ),
      ),
      body: Center(
        child: pages[index],
      ),
    );
  }
}
