import 'package:doctors/view/screens/profil_screens/privacy_screen.dart';
import 'package:doctors/view/screens/profil_screens/terms_conditions.dart';
import 'package:flutter/material.dart';

import '../../../consts/colors.dart';
import 'contact_us.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Help"),
      ),
      body: Column(
        children: [
          helpSections(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>const ContactUsScreen()));
          }, title: "Contact Us" ),
          const Divider(),
          helpSections(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> const TermScreen()));
          }, title: "Terms & Conditions" ),
          const Divider(),
          helpSections(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>const PrivacyScreen()));
          }, title: "Privacy & Policy" ),
        ],
      ),
    );
  }

  InkWell helpSections({
    required VoidCallback onTap,
    required String title,
  }) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Text(title),
        trailing: Icon(Icons.keyboard_arrow_right, color: MyColors().blueColor),
      ),
    );
  }
}
