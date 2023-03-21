import 'package:doctors/view/screens/home_screens/make_appontment_screen.dart';
import 'package:doctors/view/widgets/home_screens_widgets/home_widgtes.dart';
import 'package:flutter/material.dart';

import '../../../consts/colors.dart';
import '../../../data/specialist_doctors_data.dart';
import '../../widgets/costume_widgets.dart';
import 'comunication_screens/audio_call_screen.dart';
import 'comunication_screens/messaging_screen.dart';
import 'comunication_screens/video_call_screen.dart';

class DoctorScreen extends StatefulWidget {
  final String doctorName;
  final String doctorImage;

  const DoctorScreen(
      {Key? key, required this.doctorName, required this.doctorImage})
      : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.doctorName,
          style: TextStyle(
              fontSize: size.width * 0.06, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isFavorite =! isFavorite;
                });
                isFavorite == true ?
                costumeSnackBar(content: '${widget.doctorName} Added to favorite screen', size: size, context: context)
                    :
                costumeSnackBar(content: "${widget.doctorName} Removed from favorite screen", size: size, context: context);
              },
              icon: isFavorite == false ?
              Icon(Icons.favorite_border, color: MyColors().blueColor)
                  :
              Icon(Icons.favorite, color: MyColors().blueColor)
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                color: MyColors().blueColor,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  doctorCard(size),
                  SizedBox(height: size.height * 0.03),
                  doctorExperienceSection(size),
                  SizedBox(height: size.height * 0.03),
                  Text(
                    "About Doctor",
                    style: TextStyle(
                        fontSize: size.width * 0.043,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: size.height * 0.01),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam efficitur ante sit amet nulla dignissim, et convallis velit venenatis",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    "Working Time",
                    style: TextStyle(
                        fontSize: size.width * 0.043,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: size.height * 0.02),
                  const Text(
                    "Mon-Fri,9:00 AM - 20:00 PM",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Text(
                    "Communication",
                    style: TextStyle(
                        fontSize: size.width * 0.043,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: size.height * 0.01),
                  communicationItem(
                      size: size,
                      leadingIcon: Icons.keyboard,
                      title: 'Messaging',
                      subtitle: "Chat me up,Share photos.",
                      onPressed: () {
                        awesomeDialog(
                          context: context,
                          title: 'Confirm',
                          desc:
                              'Do you want to messaging ${widget.doctorName} for 5 \$ ??',
                          okBtn: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => MessagingScreen(
                                        doctorName: widget.doctorName,
                                        doctorImg: widget.doctorImage)));
                          },
                          cancelBtn: () {},
                        );
                      },
                      pricing: '5 \$'),
                  const Divider(color: Colors.grey),
                  communicationItem(
                      size: size,
                      leadingIcon: Icons.phone,
                      title: 'Audio Call',
                      subtitle: "Call your doctor directly",
                      onPressed: () {
                        awesomeDialog(
                          context: context,
                          title: 'Confirm',
                          desc:
                              'Do you want to make a voice call with ${widget.doctorName} for 10 \$ ??',
                          okBtn: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => VoiceCallScreen(
                                        doctorName: widget.doctorName,
                                        doctorImg: widget.doctorImage)));
                          },
                          cancelBtn: () {},
                        );
                      },
                      pricing: '10 \$'),
                  const Divider(color: Colors.grey),
                  communicationItem(
                      size: size,
                      leadingIcon: Icons.video_call,
                      title: 'Video Call',
                      subtitle: "See your doctor live",
                      onPressed: () {
                        awesomeDialog(
                          context: context,
                          title: 'Confirm',
                          desc:
                              'Do you want to make a Video call with ${widget.doctorName} for 15 \$ ??',
                          okBtn: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>  VideoCallScreen(doctorImage: widget.doctorImage)));
                          },
                          cancelBtn: () {},
                        );
                      },
                      pricing: '15 \$'),
                  SizedBox(height: size.height * 0.01),
                  costumeButton(
                      size: size, onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> const MakeAppointmentScreen()));
                  }, title: 'Make Appointment'),
                  SizedBox(height: size.height * 0.02),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell communicationItem(
      {required Size size,
      required leadingIcon,
      required String title,
      required String subtitle,
      required String pricing,
      required Function() onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        leading: Icon(leadingIcon,
            size: size.width * 0.08, color: MyColors().blueColor),
        title: Text(title),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey,
            fontSize: size.width * 0.03,
          ),
        ),
        trailing: Text(
          pricing,
          style: TextStyle(
            color: Colors.grey,
            fontSize: size.width * 0.04,
          ),
        ),
      ),
    );
  }

  Container doctorExperienceSection(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.16,
      decoration: BoxDecoration(
          color: const Color(0xFF242424),
          borderRadius: BorderRadius.circular(size.width * 0.05),
          border: Border.all(color: MyColors().blueColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          doctorExperienceItem(
              size: size,
              icon: Icons.people,
              numbers: "5000+",
              text: "Patient"),
          doctorExperienceItem(
              size: size,
              icon: Icons.person,
              numbers: "15",
              text: "Years Experiences"),
          doctorExperienceItem(
              size: size,
              icon: Icons.message,
              numbers: "3800+",
              text: "Reviews"),
        ],
      ),
    );
  }

  Column doctorExperienceItem(
      {required Size size, required icon, required numbers, required text}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: MyColors().blueColor, size: size.width * 0.09),
        SizedBox(height: size.width * 0.02),
        Text(
          numbers,
          style: TextStyle(color: MyColors().blueColor),
        ),
        SizedBox(height: size.width * 0.02),
        Text(text)
      ],
    );
  }

  Container doctorCard(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.16,
      decoration: BoxDecoration(
        color: const Color(0xFF242424),
        borderRadius: BorderRadius.circular(size.width * 0.05),
      ),
      child: Row(
        children: [
          Container(
            width: size.width * 0.3,
            height: size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(size.width * 0.05),
                  bottomLeft: Radius.circular(size.width * 0.05),
                ),
                image: DecorationImage(
                  image: NetworkImage(widget.doctorImage),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(width: size.width * 0.05),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.doctorName,
                style: TextStyle(
                    fontSize: size.width * 0.05, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: size.width * 0.02),
              Row(
                children: [
                  Icon(Icons.star_half,
                      color: MyColors().blueColor, size: size.width * 0.06),
                  Text(
                    " 4.9 (3821 reviews)",
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.width * 0.02),
              Text(
                specialistDoctors[0],
                style: TextStyle(
                  fontSize: size.width * 0.04,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
