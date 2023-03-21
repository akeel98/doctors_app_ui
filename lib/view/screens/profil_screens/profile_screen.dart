import 'dart:io';

import 'package:doctors/consts/colors.dart';
import 'package:doctors/view/screens/profil_screens/notifications_screen.dart';
import 'package:doctors/view/screens/profil_screens/security_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/costume_widgets.dart';
import '../auth_screens/sign_in.dart';
import 'appearance_screen.dart';
import 'help_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "";
  String email = "";
  File? imageFile;

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () async {
                  final pickedImage =
                      await ImagePicker().getImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    setState(() {
                      imageFile = File(pickedImage.path);
                    });
                  }
                },
                icon: Icon(Icons.edit, color: MyColors().blueColor))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              personalInformation(size),
              const Divider(),
              profileSections(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => NotificationsScreen()));
                  },
                  title: 'Notifications',
                  leading: Icons.notifications),
              const Divider(),
              profileSections(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SecurityScreen()));
                  },
                  title: 'Security',
                  leading: Icons.lock),
              const Divider(),
              profileSections(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const AppearanceScreen()));
                  },
                  title: 'Appearance',
                  leading: Icons.visibility),
              const Divider(),
              profileSections(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const HelpScreen()));
                  },
             title: 'Help',
             leading: Icons.info),
              const Divider(),
              profileSections(
                  onTap: () {}, title: 'Invite Friends', leading: Icons.people),
              const Divider(),
              profileSections(
                  onTap: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(size.width * 0.05),
                              topRight: Radius.circular(size.width * 0.05),
                            )
                        ),
                        context: context, builder: (BuildContext context){
                      return Container(
                        width: size.width,
                        height: size.height * 0.4,
                        decoration: BoxDecoration(
                          color: MyColors().bottomSheetColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(size.width * 0.05),
                            topRight: Radius.circular(size.width * 0.05),
                          )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children :[
                            SizedBox(height: size.height * 0.02),
                            headerBottumSheet(size),
                            SizedBox(height: size.height * 0.05),
                            Icon(Icons.logout,
                              size: size.width * 0.15,color: Colors.red),
                            SizedBox(height: size.height * 0.05),
                            Text("Are you sure want to logout??",style: TextStyle(
                              fontSize: size.width * 0.045,
                              fontWeight: FontWeight.bold,
                                ),
                            ),
                            SizedBox(height: size.height * 0.05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap:(){
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: size.width * 0.4,
                                    height: size.height * 0.055,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(size.width * 0.1),
                                      border: Border.all(color: MyColors().blueColor)
                                    ),
                                    child: Text("Cancel",style: TextStyle(color: MyColors().blueColor),),
                                  ),
                                ),
                                SizedBox(width: size.width * 0.05),
                                InkWell(
                                  onTap:(){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_)=> const SignInScreen()));
                                  },
                                  child: Container(
                                    width: size.width * 0.4,
                                    height: size.height * 0.055,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(size.width * 0.1),
                                        color: MyColors().blueColor
                                    ),
                                    child: const Text("Yes,logout",style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                              ],
                            )
                          ]
                        ),
                      );
                    });
                  }, title: 'Log Out', leading: Icons.logout),
            ],
          ),
        ));
  }



  InkWell profileSections({
    required VoidCallback onTap,
    required String title,
    required IconData leading,
  }) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(leading,
            color: leading == Icons.logout ? Colors.red : MyColors().blueColor),
        title: Text(title),
        trailing: Icon(Icons.keyboard_arrow_right, color: MyColors().blueColor),
      ),
    );
  }

  getInfo() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name") ?? '';
    email = prefs.getString("email") ?? '';
    setState(() {});
  }

  personalInformation(Size size) {
    return Row(
      children: [
        Container(
          width: size.width * 0.2,
          height: size.width * 0.2,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: imageFile == null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(size.width * 0.1),
                  child: Image.asset("images/pfImage.png", fit: BoxFit.fill))
              : ClipRRect(
                  borderRadius: BorderRadius.circular(size.width * 0.1),
                  child: Image.file(
                    imageFile!,
                    fit: BoxFit.cover,
                  )),
        ),
        SizedBox(width: size.width * 0.05),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: size.width * 0.055,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.width * 0.02),
            Text(
              email,
              style: TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }
}
