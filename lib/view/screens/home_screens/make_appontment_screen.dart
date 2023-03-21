import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:doctors/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

import '../../widgets/costume_widgets.dart';

class MakeAppointmentScreen extends StatefulWidget {
  const MakeAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<MakeAppointmentScreen> createState() => _MakeAppointmentScreenState();
}

class _MakeAppointmentScreenState extends State<MakeAppointmentScreen> {
  int selectedColor = 0;
  bool isMale = true;
  bool isFemale = false;
  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("New Appointment"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formState,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              costumeCalender(size),
              Text(
                "Available Time",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: size.height * 0.02),
              availableTimes(size),
              SizedBox(height: size.height * 0.02),
              Text(
                "Patient Details",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: formFieldDecoration(size).copyWith(
                        hintText: "Full Name",
                      ),
                      validator: (val){
                        if(val == ""){
                          return "Please fill this field";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextFormField(
                      decoration: formFieldDecoration(size).copyWith(
                        hintText: "Age",
                      ),
                      validator: (val){
                        if(val == ""){
                          return "Please fill this field";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      "Gender",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.04,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Row(
                      children: [
                        genderContainer(size: size, gender: 'Male', onPressed: () {
                          setState(() {
                            isMale =! isMale;
                            isFemale = false;
                          });
                        }, color: isMale == true?MyColors().blueColor:Colors.transparent),
                        SizedBox(width: size.width * 0.03),
                        genderContainer(size: size, gender: 'Female', onPressed: () {
                          setState(() {
                            isFemale =! isFemale;
                            isMale = false;
                          });
                        }, color: isFemale == true?MyColors().blueColor:Colors.transparent),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextFormField(
                      maxLines: 8,
                      decoration: formFieldDecoration(size).copyWith(
                        hintText: "Write your problem",
                      ),
                      validator: (val){
                        if(val == ""){
                          return "Please fill this field";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: size.height * 0.02),
                    costumeButton(
                        size: size, onPressed: () {
                          if(_formState.currentState!.validate()){
                            AwesomeDialog(
                              context: context,
                              dialogBackgroundColor: const Color(0xFF242424),
                              dismissOnTouchOutside: false,
                              autoDismiss: true,
                              dialogType: DialogType.success,
                              animType: AnimType.rightSlide,
                              title: "Success",
                              desc: "Your Appointment is complete successfully",
                              btnCancelOnPress: (){},
                              btnOkOnPress: (){},
                            ).show();
                          }
                    }, title: "Set Appointment "),
                    SizedBox(height: size.height * 0.02),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell genderContainer({required Size size,required String gender,required Function() onPressed,required color}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: size.width * 0.2,
        height: size.height * 0.06,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(size.width * 0.03),
            border: Border.all(color: Colors.grey)),
        child: Text(gender),
      ),
    );
  }

  SizedBox availableTimes(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.3,
      child: GridView.builder(
        itemCount: appointmentTimes.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: size.width * 0.17,
            childAspectRatio: 3 / 3.9,
            mainAxisSpacing: size.width * 0.02,
            crossAxisSpacing: size.width * 0.02),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedColor = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(size.width * 0.03),
              decoration: BoxDecoration(
                color: selectedColor == index
                    ? MyColors().blueColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(size.width * 0.05),
                border: Border.all(color: Colors.grey),
              ),
              child: Text(appointmentTimes[index]),
            ),
          );
        },
      ),
    );
  }

  List appointmentTimes = [
    "09:00AM",
    "09:30AM",
    "10:00AM",
    "10:30AM",
    "11:00AM",
    "11:30AM",
    "12:00PM",
    "12:30PM",
    "01:00PM",
    "01:30PM",
    "02:00PM",
    "02:30PM",
    "03:00PM",
    "03:30PM",
    "04:00PM",
    "04:30PM",
    "05:00PM",
    "05:30PM",
    "06:00PM",
    "06:30PM",
    "07:00PM",
    "07:30PM",
    "08:00PM"
  ];
}
