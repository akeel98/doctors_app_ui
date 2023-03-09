import 'package:flutter/material.dart';

import '../../../consts/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Notification"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Today",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: size.height * 0.03),
              notificationCart(
                  size: size,
                  color: Colors.red,
                  icon: Icons.alarm,
                  title: 'Appointment',
                  desc: 'Your appointment will be start after 15 minutes, stay with app and take care',
              ),
              SizedBox(height: size.height * 0.03),
              notificationCart(
                size: size,
                color: Colors.blue,
                icon: Icons.check_circle,
                title: 'Appointment confirmed',
                desc: 'Appointment confirmed DR.Sarah Wagner call will be held at 9:00 Am |26 may',
              ),
              SizedBox(height: size.height * 0.03),
              const Text(
                "Yesterday",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: size.height * 0.03),
              notificationCart(
                size: size,
                color: Colors.yellow,
                icon: Icons.notifications,
                title: 'New Features Available ',
                desc: 'Now you can mirror video while on video call',
              ),
              SizedBox(height: size.height * 0.03),
              const Text(
                "Monday",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: size.height * 0.03),
              notificationCart(
                size: size,
                color: Colors.red,
                icon: Icons.alarm,
                title: 'Appointment',
                desc: 'Your appointment will be start after 15 minutes, stay with app and take care',
              ),
              SizedBox(height: size.height * 0.03),
              notificationCart(
                size: size,
                color: Colors.blue,
                icon: Icons.check_circle,
                title: 'Appointment confirmed',
                desc: 'Appointment confirmed DR.Sarah Wagner call will be held at 9:00 Am |26 may',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container notificationCart({
    required Size size,
    required Color color,
    required icon,
    required String title,
    required String desc,
    }
  ) {
    return Container(
      width: size.width,
      height: size.height * 0.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.width * 0.05),
          color: MyColors().canvasColor),
      child: Row(
        children: [
          CircleAvatar(
            radius: size.width * 0.1,
            backgroundColor: color,
            child:
                Icon(icon, size: size.width * 0.09, color: Colors.white),
          ),
          SizedBox(width: size.width * 0.03),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  desc,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    // color:Colors.white,
                    fontSize: size.width * 0.035,
                    // fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
